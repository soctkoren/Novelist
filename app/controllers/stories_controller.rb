class StoriesController < ApplicationController
	def index
		@root_url = "https://source.unsplash.com/"
		@query = "/800x640"
		@stories = Story.all
	end

	def show
		@root_url = "https://source.unsplash.com/"
		@query = "/800x640"
		@story = Story.find(params[:id])
		
		# for writing a new segment
		if user_signed_in?
			@new_segment = Segment.new
			@new_sentence = Sentence.new
		end

			@segs = @story.segments
			@win_seg = @segs.where(winning_sentence: true)
			
			last_seg_time = @win_seg.last.updated_at
			@active_segs = @segs.where("updated_at >= ?", last_seg_time);
			puts @active_segs
			@sorted = @active_segs.sort { |a,b| b.sentence.get_vote_count <=> a.sentence.get_vote_count }
			puts @sorted

			#TODO refactor into the model when you have time
			# logic for update
			update_timer_in_sec = 180
			next_winner_time = @win_seg.last.updated_at + update_timer_in_sec
			#convert from UTC to PST just for display
			@display = next_winner_time.in_time_zone("Pacific Time (US & Canada)").strftime("%I %M %p") 

			if @story.segment_ended? > 180
				puts @story.segment_ended?
				puts "it's time to udate some shit"

				all_current_segs = @segs.where("updated_at >= ?", last_seg_time);
				# winning_sentence = all_current_segs.order()
				puts all_current_segs

				# active_segs = @story.grab_all_active_segments(last_winning_seg_time)
				#find all segments where time is greater than the last updated time of the last winning segment
			end

			@contributors = []
			@win_seg.each do |seg|
			@contributors << seg.sentence.user
		end
	end

	def new
		if user_signed_in?

			@root_url = "https://source.unsplash.com/"
			@story = Story.new
			@segment = Segment.new
			@sentence = Sentence.new
			# Need to ajax this to be a dynamic search
		else
			redirect_to '/users/sign_in'
		end
	end

	def edit
	end

	def create
		# puts Unsplash::Photo.find("tAKXap853rY").methods
		@story = Story.create(story_params)
		segment = Segment.create(story_id: @story.id, winning_sentence: true)
		@first_sentence = story_params[:sentence]
		sentence = Sentence.create(segment_id: segment.id, user_id: story_params[:user_id], sentence: @first_sentence)
		# vote = Vote.create(vote_count: 1, user_id: story_params[:user_id], sentence_id: sentence.id)
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


	def images
		if request.xhr?
			search = params[:search]
			@photos = Unsplash::Photo.search("#{search}")

			ids = []
			@photos.each do |photo|
				ids << photo.id
			end
			
			# root_url "https://source.unsplash.com/"
			# query
			# hash = {}
			p @photos[0].methods
			#TODO build the html links here and send it back.
			render json: @photos
		else
			new_story_path
		end
	end

	private

		def story_params
			params.require(:story).permit(:title, :image_url, :user_id, :sentence)
		end

end

