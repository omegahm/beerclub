class AddBankAccountToSettings < ActiveRecord::Migration
  def up
    Setting.create!(key: 'reg_no', value: '2403')
    Setting.create!(key: 'account_no', value: '4381 563 672')
  end

  def down
    # noop
  end
end
