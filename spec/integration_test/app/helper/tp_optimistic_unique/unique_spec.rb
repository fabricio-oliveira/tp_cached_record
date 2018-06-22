# frozen_string_literal: true
require 'rails_helper'

RSpec.describe TPCachedRecord, type: :request do
  describe 'create two model same uuid' do
    context 'When have act_as_unique' do
      context 'create' do
        before do
          post foo_index_path, uuid: '5ea880de-e4ce-4770-8d10-c89bac181e40', other: 'bla bla'
          post foo_index_path, uuid: '5ea880de-e4ce-4770-8d10-c89bac181e40', other: 'bla bla'
        end

        it 'Does return status_code: 400 (get errors)' do
          expect(response.status).to eq 400
        end
      end

      context 'create!' do
        before do
          post pepe_index_path, uuid: '5ea880de-e4ce-4770-8d10-c89bac181e40', other: 'bla bla'
        end

        it 'raise error ActiveRecord::RecordInvalid' do
          expect { post pepe_index_path, uuid: '5ea880de-e4ce-4770-8d10-c89bac181e40', other: 'bla bla' }.to raise_error(ActiveRecord::RecordInvalid)
        end
      end
    end

    context 'When unique is not activated' do
      context 'create' do
        before do
          post bar_index_path, uuid: '5ea880de-e4ce-4770-8d10-c89bac181e40', other: 'bla bla'
        end

        it 'raise error ActiveRecord::RecordNotUnique' do
          expect { post bar_index_path, uuid: '5ea880de-e4ce-4770-8d10-c89bac181e40', other: 'bla bla' }.to raise_error(ActiveRecord::RecordNotUnique)
        end
      end
    end
  end
end
