class AwardsController < ApplicationController

    def new
        @award = award.new
    end

    def create
        @award = award.new(award_params)
    end


    private

    def award_params
        params.require(:award).permit(:title, :image) ## Rails 4 strong params usage
    end

end