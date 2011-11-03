class PagesController < ApplicationController
  respond_to :html, :json
  before_filter :get_page, only: [:show, :edit, :update, :destroy]
  before_filter :new_page, only: [:new, :create]

  # GET /pages
  # GET /pages.json
  def index
    @pages = Page.all
    respond_with @pages
  end

  # GET /pages/1
  # GET /pages/1.json
  def show
    respond_with @page
  end

  # GET /pages/new
  # GET /pages/new.json
  def new
    respond_with @page
  end

  # GET /pages/1/edit
  def edit
    respond_with @page
  end

  # POST /pages
  # POST /pages.json
  def create
    @page.save
    respond_with @page
  end

  # PUT /pages/1
  # PUT /pages/1.json
  def update
    @page.update_attributes(params[:page])
    respond_with @page
  end

  # DELETE /pages/1
  # DELETE /pages/1.json
  def destroy
    @page.destroy
    respond_with @page
  end

protected
  def get_page
    id = params[:id] 
    @page = Page.find(id)
  rescue
    if id == 'home'
      @page = Page.create name: id
    else
      redirect_to new_path(@page)
    end
  end
  def new_page
    page = params[:page] || {}
    id = params[:id]
    if id
      page[:name] ||= id
    end
    @page = Page.new(page)
  end
end
