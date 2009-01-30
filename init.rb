require File.dirname(__FILE__) + '/lib/hit_it'
ActiveRecord::Base.__send__ :include, HitIt