class Book < ApplicationRecord
	#バリデーションは該当するモデルに設定する。エラーにする条件を設定できる。
	#presence trueは空欄の場合を意味する。
	belongs_to :user
	validates :title, :body, presence: true
	validates :body, length: {maximum: 200}
end
