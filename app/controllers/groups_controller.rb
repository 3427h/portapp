class GroupsController < ApplicationController
  def new
    @group = Group.new
  end

  def index
    @groups = Group.all
  end

  def show
    @group = Group.find(params[:id])
  end

  def edit
    @group = Group.find(params[:id])
  end

  def create
    @group = Group.new(group_params)
    if @group.save
      redirect_to groups_url, notice: "「#{@group.gname}」を登録しました"
    else
      render :new
    end
  end

  def update
    respond_to do |format|
      if @group.update(group_params)
        format.html { redirect_to group_url(@group), notice: "編集しました。" }
        format.json { render :show, status: :ok, location: @group }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @group.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    group = Group.find(params[:id])
    group.destroy
    respond_to do |format|
      format.html { redirect_to groups_url, notice: "削除しました。"}
      format.json { head :no_content }
    end
  end

  private
    def set_group
      @group = Group.find(params[:id])
    end

    def group_params
      params.require(:group).permit(:gname)
    end
end
