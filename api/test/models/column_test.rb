# == Schema Information
#
# Table name: columns
#
#  id         :bigint(8)        not null, primary key
#  board_id   :bigint(8)
#  name       :string
#  title      :string
#  position   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class ColumnTest < ActiveSupport::TestCase
  def setup
    @column = Column.new(
      board: boards(:personal),
      name: 'backlog',
      title: 'Backlog',
      position: 4
    )
  end

  test 'should be valid' do
    assert @column.valid?
  end

  test 'board should be present' do
    @column.board = nil

    assert_not @column.valid?
  end
  
  test 'name should be present' do
    @column.name = '    '

    assert_not @column.valid?
  end
end
