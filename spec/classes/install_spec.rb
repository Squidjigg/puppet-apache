# frozen_string_literal: true

require 'spec_helper'

describe 'apache::install' do
  on_supported_os.each do |os, os_facts|
    context "on #{os}" do
      let(:facts) { os_facts }

      it { is_expected.not_to compile.with_all_deps }
    end
  end
end
