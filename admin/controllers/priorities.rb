Admin.controllers :priorities do

  get :index do
    @priorities = Priority.all
    render 'priorities/index'
  end

  get :new do
    @priority = Priority.new
    render 'priorities/new'
  end

  post :create do
    @priority = Priority.new(params[:priority])
    if @priority.save
      flash[:notice] = 'Priority was successfully created.'
      redirect url(:priorities, :edit, :id => @priority.id)
    else
      render 'priorities/new'
    end
  end

  get :edit, :with => :id do
    @priority = Priority.find(params[:id])
    render 'priorities/edit'
  end

  put :update, :with => :id do
    @priority = Priority.find(params[:id])
    if @priority.update_attributes(params[:priority])
      flash[:notice] = 'Priority was successfully updated.'
      redirect url(:priorities, :edit, :id => @priority.id)
    else
      render 'priorities/edit'
    end
  end

  delete :destroy, :with => :id do
    priority = Priority.find(params[:id])
    if priority.destroy
      flash[:notice] = 'Priority was successfully destroyed.'
    else
      flash[:error] = 'Impossible destroy Priority!'
    end
    redirect url(:priorities, :index)
  end      
end