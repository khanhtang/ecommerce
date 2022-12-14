require "rails_helper"

RSpec.describe AdminMailer, type: :mailer do
  describe "week_summary" do
    let(:mail) { AdminMailer.week_summary }

    it "renders the headers" do
      expect(mail.subject).to eq("Week summary")
      expect(mail.to).to eq(["to@example.org"])
      expect(mail.from).to eq(["from@example.com"])
    end

    it "renders the body" do
      expect(mail.body.encoded).to match("Hi")
    end
  end

end
