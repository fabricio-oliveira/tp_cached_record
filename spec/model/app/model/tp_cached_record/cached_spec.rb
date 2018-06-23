# frozen_string_literal: true
require 'rails_helper'

RSpec.describe TPCachedRecord, type: :model do
  describe 'recovery two times same value' do
    context 'When has not act_as_cache' do
      subject do
        Bar.find_by(id: 1)
        Bar.find_by(id: 1)
      end

      let!(:bar) do
        create(:bar)
      end

      before do
        allow(Bar).to receive(:find_by).and_call_original
      end

      it 'Does two times real method find_by' do
        subject
        expect(Bar).to have_received(:find_by).twice
      end

      it 'Does return current Value' do
        expect(subject).to eq(Bar.first)
      end
    end

    context 'When has act_as_cache' do
      subject do
        Foo.find_by(id: 1)
        Foo.find_by(id: 1)
      end

      let!(:foo) do
        create(:foo)
      end

      before do
        allow(Foo).to receive(:find_by).and_call_original
      end

      it 'Does two times real method find_by' do
        subject
        expect(Foo).to have_received(:find_by).twice
      end

      # it 'Does return current Value' do
      #   expect(subject).to eq(Bar.first)
      # end
    end
  end
end
