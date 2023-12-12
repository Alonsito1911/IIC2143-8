class AddRequestsToUser < ActiveRecord::Migration[7.0]
  def change
    add_reference :requests, :user, foreign_key: true
  end
end
#postgres://db_software:Ny5RIVHcqLA0BalWz2vX1PZuqcItX6ge@dpg-ci6v21enqql0lddi01eg-a/db_software_dsyy
#postgres://db_software:Ny5RIVHcqLA0BalWz2vX1PZuqcItX6ge@dpg-ci6v21enqql0lddi01eg-a.oregon-postgres.render.com/db_software_dsyy