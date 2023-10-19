FactoryBot.define do
  factory :group do
    name { 'Sample Group' }
    icon { '<i class="bi bi-bus-front" style="font-size: 2rem; color: cornflowerblue;"></i>' }
    user { create(:user) }
  end
end
