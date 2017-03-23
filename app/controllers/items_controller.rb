class ItemsController < ApplicationController

  def new
    @item = Item.new
  end

   def create
     @user = User.find(current_user.id)
     @item = Item.new(item_params)
     @item.user = @user

     if @item.save
       flash[:notice] = "Item saved successfully."
 # #12
       redirect_to @user
     else
       flash[:alert] = "Item failed to save."
 # #13
       redirect_to @user
     end
   end

   def destroy
     @user = User.find(current_user.id)
     item = @user.items.find(params[:id])

     if item.destroy
       flash[:notice] = "Item was deleted."
       redirect_to @user
     else
       flash[:alert] = "Item couldn't be deleted. Try again."
       redirect_to @user
     end
   end

end

private

def item_params
     params.require(:item).permit(:name)
end
