# frozen_string_literal: true

$LOAD_PATH << './lib'
require 'cats'

sleep(1 + rand(5))

run Cats::Web

# frozen_string_literal: true

$LOAD_PATH << './lib'
require 'cats'

# cnfigurable startup delay
max_delay = ENV.fetch('STARTUP_DELAY_MAX', '5').to_i
min_delay = ENV.fetch('STARTUP_DELAY_MIN', '1').to_i
sleep(rand(min_delay..max_delay))

run Cats::Web
