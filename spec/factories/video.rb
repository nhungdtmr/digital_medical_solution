FactoryBot.define do
  factory :video do
    name {FFaker::Name.name}
    video_url {"video-1551423374.mp4"}
    after(:build) do |video|
      user = FactoryBot.create :user
      video.user_id = user.id
    end
  end
end
