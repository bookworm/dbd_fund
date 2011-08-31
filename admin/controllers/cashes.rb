Admin.controllers :cashes do

  get :index do
    @cashes = Cash.all
    render 'cashes/index'
  end

  get :new do
    @cash = Cash.new
    render 'cashes/new'
  end

  post :create do
    @cash = Cash.new(params[:cash])
    if @cash.save
      flash[:notice] = 'Cash was successfully created.'
      redirect url(:cashes, :edit, :id => @cash.id)
    else
      render 'cashes/new'
    end
  end

  get :edit, :with => :id do
    @cash = Cash.find(params[:id])
    render 'cashes/edit'
  end

  put :update, :with => :id do
    @cash = Cash.find(params[:id])
    if @cash.update_attributes(params[:cash])
      flash[:notice] = 'Cash was successfully updated.'
      redirect url(:cashes, :edit, :id => @cash.id)
    else
      render 'cashes/edit'
    end
  end

  delete :destroy, :with => :id do
    cash = Cash.find(params[:id])
    if cash.destroy
      flash[:notice] = 'Cash was successfully destroyed.'
    else
      flash[:error] = 'Impossible destroy Cash!'
    end
    redirect url(:cashes, :index)
  end    
end