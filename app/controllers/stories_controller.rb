class StoriesController < ApplicationController

	def index
		@stories = Story.all
	end

	def show
		@story = Story.find(params[:id])
	end

	def new
		@story = Story.new
	end

	def edit
	end

	def create
		@story = Story.create(story_params)

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
			params.require(:story).permit(:title, :image_url, :user_id)
		end

end
