require 'rails_helper'

RSpec.describe Tree, type: :model do
  describe '.name' do
    let(:tree1) { FactoryGirl.build(:tree, name: 'Test') }
    let(:tree2) { FactoryGirl.build(:tree) }

    it 'must be unique' do
      tree1.save
      tree2.name = 'Test'
      tree2.save
      expect(tree2).to_not be_valid
    end
  end
end
