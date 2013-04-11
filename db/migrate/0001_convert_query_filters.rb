class ConvertQueryFilters < ActiveRecord::Migration
  def up
    Query.all.each do |q|
      f = q.filters
      if i = f['involvement']
        if i[:values] == ['1']
          f.delete('involvement')
          i[:values] = ['me']
          f['involved_user_id'] = i
          q.save
        end
      end
    end
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
