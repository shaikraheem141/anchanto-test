class IxamsController < ApplicationController
  before_action :set_ixam, only: [:show, :edit, :update, :destroy]

  # GET /ixams
  # GET /ixams.json
  def index
    @ixams = Ixam.all
  end

  # GET / POST /ixams/1/add_questions
  def add_questions
    @questions = Question.all

    if request.post?
      @ixam = Ixam.find(params[:id])

      if !params[:sel_ques].empty?
        params[:sel_ques].each do |sel_que|
          @ixam.questions << Question.find(sel_que.to_i)
        end
      end

      redirect_to ixam_path(params[:id]), notice: 'Questions added successfully.'
    end
  end

  # GET /ixams/1
  # GET /ixams/1.json
  def show
    @ques_count = @ixam.questions.count
  end

  # GET /ixams/new
  def new
    @ixam = Ixam.new
  end

  # GET /ixams/1/edit
  def edit
  end

  # POST /ixams
  # POST /ixams.json
  def create
    @ixam = Ixam.new(ixam_params)

    respond_to do |format|
      if @ixam.save
        format.html { redirect_to @ixam, notice: 'Ixam was successfully created.' }
        format.json { render :show, status: :created, location: @ixam }
      else
        format.html { render :new }
        format.json { render json: @ixam.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /ixams/1
  # PATCH/PUT /ixams/1.json
  def update
    respond_to do |format|
      if @ixam.update(ixam_params)
        format.html { redirect_to @ixam, notice: 'Ixam was successfully updated.' }
        format.json { render :show, status: :ok, location: @ixam }
      else
        format.html { render :edit }
        format.json { render json: @ixam.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ixams/1
  # DELETE /ixams/1.json
  def destroy
    @ixam.destroy
    respond_to do |format|
      format.html { redirect_to ixams_url, notice: 'Ixam was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ixam
      @ixam = Ixam.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def ixam_params
      params.require(:ixam).permit(:name, :sel_ques)
    end
end
