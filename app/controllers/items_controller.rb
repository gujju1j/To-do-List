class ItemsController < ApplicationController
	before_action :find_item, only: [:show, :edit, :update, :destroy, :complete, :uncomplete]

	def index
		if user_signed_in?
			@items = Item.where(:user_id => current_user.id).or(Item.where(assignee_id: current_user.id)).order("created_at DESC")
			@users = User.all

			respond_to do |format|
				format.html { render :index }
				format.json { render json: @items.to_json}
			end
		end
	end

	def new
		@item = current_user.items.build
	end

	def show

	end

	def edit
	end

	def update
		if @item.update(item_params)
			respond_to do |format|
				format.html { redirect_to items_path }
				format.js { render js: "alert('updated')" }
			end
		else
			respond_to do |format|
				format.html { render 'edit' }
				format.js { render js: "alert('Not updated')" }
			end
		end
	end

	def create
		@item = current_user.items.build(item_params)
		#@username = user.find(session[:current_user.id]).name
		if @item.save
			redirect_to root_path
		else
			render 'new'
		end
	end

	def destroy
		@item.destroy
		redirect_to root_path
	end

	def complete
		@item.update_attribute(:completed_at, Time.now)
		redirect_to root_path
	end

	def uncomplete
		@item.update_attribute(:completed_at, nil)
		redirect_to root_path
	end

	private

	def item_params
		params.require(:item).permit(:title, :description, :assignee_id)
	end

	def find_item
		@item = Item.find(params[:id])
	end

end
