class MembersController < ApplicationController
   before_action :require_login

   def create
      @organization=Organization.find(params[:id])

      Member.create(user: current_user, organization: @organization) unless @organization.users.include?(current_user)

      return redirect_to :back

   end

   def destroy

      @organization=Organization.find(params[:id])

      Member.find_by(organization: @organization, user: current_user).delete

      return redirect_to :back
   end

end
