class Form < ApplicationRecord
  include ActiveModel::Model
  attr_accessor :hoge,:fuga...

  belongs_to :history

  def save
    # 各テーブルにデータを保存する処理を書く
  end
end