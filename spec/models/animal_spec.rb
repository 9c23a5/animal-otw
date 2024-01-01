# frozen_string_literal: true

require "rails_helper"

RSpec.describe Animal, type: :model do
  subject { described_class.new(name: "Dog") }

  it "is valid with valid attributes" do
    expect(subject).to be_valid
  end

  it "is invalid without a name" do
    subject.name = nil

    expect(subject).to_not be_valid
  end

  context "has a wikipedia link" do
    context "valid english wikipedia link" do
      let(:wikipedia_link) { "https://en.wikipedia.org/wiki/Dog" }

      it "is valid with valid wikipedia_link" do
        subject.wikipedia_link = wikipedia_link
        expect(subject).to be_valid
      end
    end

    context "valid french wikipedia link" do
      let(:wikipedia_link) { "https://fr.wikipedia.org/wiki/Chien" }

      it "is not valid with invalid wikipedia_link" do
        subject.wikipedia_link = wikipedia_link
        expect(subject).to_not be_valid
        expect(subject.errors.key?("wikipedia_link")).to be true
      end
    end

    context "unknown website link" do
      let(:wikipedia_link) { "https://foo.bar/Dog" }

      it "is not valid with invalid wikipedia_link" do
        subject.wikipedia_link = wikipedia_link
        expect(subject).to_not be_valid
        expect(subject.errors.key?("wikipedia_link")).to be true
      end
    end
  end

  context "existing record with same name" do
    let!(:animal) { described_class.create!(name: "Dog") }

    it "is not valid if name is not unique" do
      expect(subject).to_not be_valid
    end
  end
end
