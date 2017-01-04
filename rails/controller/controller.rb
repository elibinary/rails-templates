<% if namespaced? -%>
require_dependency "<%= namespaced_path %>/application_controller"
<% end -%>

<% module_namespacing do -%>
class <%= class_name %>Controller < ApplicationController
  before_action :set_<%= singular_table_name %>, only: [:show, :edit, :update, :destroy]

  # GET <%= route_url %>
  def index
    @<%= plural_table_name %> = <%= file_name.singularize.camelize %>.all.page(params[:page])
  end

  # GET <%= route_url %>/1
  def show
  end

  # GET <%= route_url %>/new
  def new
    @<%= singular_table_name %> = <%= file_name.singularize.camelize %>.new
  end

  # GET <%= route_url %>/1/edit
  def edit
  end

  # POST <%= route_url %>
  def create
    @<%= singular_table_name %> = <%= file_name.singularize.camelize %>.new(<%= "#{singular_table_name}_params" %>)

    if @<%= singular_table_name %>.save
      redirect_to @<%= singular_table_name %>, notice: <%= "'#{human_name} was successfully created.'" %>
    else
      render :new
    end
  end

  # PATCH/PUT <%= route_url %>/1
  def update
    if @<%= singular_table_name %>.update(<%= "#{singular_table_name}_params" %>)
      redirect_to @<%= singular_table_name %>, notice: <%= "'#{human_name} was successfully updated.'" %>
    else
      render :edit
    end
  end

  # DELETE <%= route_url %>/1
  def destroy
    @<%= singular_table_name %>.destroy
    redirect_to <%= index_helper %>_url, notice: <%= "'#{human_name} was successfully destroyed.'" %>
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_<%= singular_table_name %>
      @<%= singular_table_name %> = <%= file_name.singularize.camelize %>.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def <%= "#{singular_table_name}_params" %>
      params.require(:<%= file_name.singularize %>).permit(:attribute)
    end
end
<% end -%>