class QuestionsController < ApplicationController
  before_action :set_question, only: [:show, :edit, :update, :destroy]
  before_action :get_categories, only: [:index, :show, :edit, :update, :new]
  # GET /questions
  # GET /questions.json
  def index
    @questions = Question.all
    @questions = @questions.status(params[:status]) if params[:status].present?
    @questions = @questions.user_id(params[:user_ids]) if params[:user_ids].present?
    @questions = @questions.in_category(params[:category_ids]) if params[:category_ids].present?
    @questions = @questions.search(params[:search]) if params[:search].present?
    @status_filter = params[:status] || []
    @user_filer = params[:user_ids] || []
    @category_filer = params[:category_ids] || []
    @users = User.all
    
    filters_string = all_filters_string

    @filters = filters_string == "" ? "All Questions" : filters_string
  end

  # GET /questions/1
  # GET /questions/1.json
  def show
    @answers = Answer.where(question_id: @question.id).all
    @answer = Answer.new
    session[:q_id] = @question.id
    @user_id = session[:user_id]
  end

  # GET /questions/new
  def new
    if !(session[:user_id])
      @user = User.new
      render 'users/new'
    else
      @question = Question.new
    end
  end

  # GET /questions/1/edit
  def edit
  end

  # POST /questions
  # POST /questions.json
  def create
    @question = Question.new(question_params)

    respond_to do |format|
      if @question.save
        format.html { redirect_to @question, notice: 'Question was successfully created.' }
        format.json { render :show, status: :created, location: @question }
      else
        format.html { render :new }
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /questions/1
  # PATCH/PUT /questions/1.json
  def update
    respond_to do |format|
      if @question.update(question_params)
        format.html { redirect_to @question, notice: 'Question was successfully updated.' }
        format.json { render :show, status: :ok, location: @question }
      else
        format.html { render :edit }
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /questions/1
  # DELETE /questions/1.json
  def destroy
    @question.destroy
    respond_to do |format|
      format.html { redirect_to questions_url, notice: 'Question was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def markdown(text)
    options = [:hard_wrap, :filter_html, :autolink, :no_intraemphasis, :fenced_code, :gh_blockcode]
    syntax_highlighter(Redcarpet.new(text, *options).to_html).html_safe
  end

  private
    def all_filters_string
      search_string = params[:search].present? ? search_filter_string + " -> " : ""
      status_string = params[:status].present? ? status_filter_string(params[:status]) + " -> " : ""
      category_string = params[:category_ids].present? ? "In: " + category_filter_string(params[:category_ids]) + " -> " : ""
      user_string = params[:user_ids].present? ? "By: " + user_filter_string(params[:user_ids]) + " -> " : ""
      search_string + status_string + category_string + user_string
    end

    def search_filter_string
      "'#{params[:search]}'"
    end

    def status_filter_string(statuses)
      status_filter_array = statuses.map {|status| status == 't' ? "Answered" : "Pending"}
      status_filter_string = status_filter_array.join(" or ")
    end

    def category_filter_string(category_ids)
      category_filter_array = category_ids.map {|id|  @categories.where(id: id).first.name}
      category_filter_string = category_filter_array.join(" or ")
    end

    def user_filter_string(user_ids)
      user_filter_array = user_ids.map {|id|  @users.where(id: id).first.name}
      user_filter_string = user_filter_array.join(" or ")
    end
    # Use callbacks to share common setup or constraints between actions.
    def set_question
      @question = Question.find(params[:id])
    end

    def get_categories
      @categories = Category.all
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def question_params
      params[:question][:user_id] = session[:user_id].to_i

      params.require(:question).permit(:text, :subject, :user_id, :search, :category_ids => [])
    end
end
