class StoriesController < ApplicationController
	def index
		@stories = Story.all
	end

	def show
		@story = Story.find(params[:id])
	end

	def new
		@story = Story.new
		@segment = Segment.new
		@sentence = Sentence.new


	end

	def edit
	end

	def create
		@story = Story.create(story_params)
		segment = Segment.create(story_id: @story.id)
		sentence = Sentence.create(sentence: story_params[:sentence], segment_id: segment.id)
		vote = Vote.create(vote_count: 1, user_id: story_params[:user_id], sentence_id: sentence.id)

	 	respond_to do |format|
	    if @story.save
	      format.html { redirect_to @story, notice: 'Story was successfully created.' }
	      format.json { render :show, status: :created, location: @story }
	    else
	      format.html { render :new }
	      format.json { render json: @story.errors, status: :unprocessable_entity }
	    end
  	end
	end

	def update
    respond_to do |format|
      if @story.update(story_params)
        format.html { redirect_to @story, notice: 'Story was successfully updated.' }
        format.json { render :show, status: :ok, location: @story }
      else
        format.html { render :edit }
        format.json { render json: @story.errors, status: :unprocessable_entity }
      end
    end		
	end

	def destroy
    @story.destroy
    respond_to do |format|
      format.html { redirect_to Storys_url, notice: 'Story was successfully destroyed.' }
      format.json { head :no_content }
    end
	end

	private

		def story_params
			params.require(:story).permit(:title, :image_url, :user_id, :sentence)
		end

end

