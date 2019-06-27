Rails.application.routes.draw do
  get 'anagrams/index'
  get ':words', to: 'anagrams#index'
end
