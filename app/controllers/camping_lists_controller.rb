class CampingListsController < ApplicationController

def index
  @camping_lists = CampingList.all
end



end
