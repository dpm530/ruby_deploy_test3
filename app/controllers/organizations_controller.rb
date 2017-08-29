class OrganizationsController < ApplicationController
   before_action :require_login, only: [:show]

   def index
      @organizations=Organization.all

   end

   def show
      @organization=Organization.find(params[:id])
   end

   def create

      @organization=Organization.new(organization_params)

      if @organization.save

         Member.create(user: current_user, organization:@organization )

         flash[:notice]=["New Organization Created."]

         return redirect_to :back

      end

      flash[:errors]=@organization.errors.full_messages

      return redirect_to :back

   end

   def destroy
      @organization=Organization.find(params[:id])

      @organization.destroy

      return redirect_to :back
   end


   private
      def organization_params
         params.require(:organization).permit(:id,:name, :description).merge(user: current_user)
      end

end
