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


  def favorite
    entry = Entry.find(params[:id])
    begin  
      current_user.entries << entry
      redirect_to favorites_url, notice: "Favorite was added."
    rescue
      redirect_to :root, notice: "That article is already in your favorites"
    end
  end


    private

    def set_entry
      @entry = Entry.find(params[:id])
    end

    def entry_params
      params.fetch(:entry, {})
    end
  end
