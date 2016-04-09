class EntriesController < ApplicationController
  before_action :set_entry, only: [:show, :edit, :update, :destroy, :favorite]

  def index
    @entries = Entry.order('created_at DESC')
  end

  def show
  end

  def new
    @entry = Entry.new
  end

  def edit
  end

  def create
    @entry = Entry.new(entry_params)

    respond_to do |format|
      if @entry.save
        format.html { redirect_to @entry, notice: 'Entry was successfully created.' }
        format.json { render :show, status: :created, location: @entry }
      else
        format.html { render :new }
        format.json { render json: @entry.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @entry.update(entry_params)
        format.html { redirect_to @entry, notice: 'Entry was successfully updated.' }
        format.json { render :show, status: :ok, location: @entry }
      else
        format.html { render :edit }
        format.json { render json: @entry.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @entry.destroy
    respond_to do |format|
      format.html { redirect_to entries_url, notice: 'Entry was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def favorite
    entry = Entry.find(params[:id])
    current_user.entries << entry
    redirect_to :root
  end
  
  private

    def set_entry
      @entry = Entry.find(params[:id])
    end
  
    def entry_params
      params.fetch(:entry, {})
    end
end
