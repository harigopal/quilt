require_relative 'test_helper'

class ScarfTest < Test::Unit::TestCase
  def setup
    @tmp_dir = File.join 'test', 'tmp'

    unless File.exist? @tmp_dir
      Dir.mkdir @tmp_dir
    end
  end

  def teardown
    if File.exist? @tmp_dir
      FileUtils.rm_r @tmp_dir
    end
  end

  def test_identicon
    identicon = Scarf::Identicon.new
    assert_instance_of Scarf::Identicon, identicon
    path = File.join 'test', 'tmp', 'test'
    identicon.write path
    assert File.exist?(path)
    File.unlink path
  end

  def test_to_blob
    identicon = Scarf::Identicon.new
    path_b = File.join 'test', 'tmp', 'test_to_blob.png'
    path_w = File.join 'test', 'tmp', 'test_write.png'

    open(path_b, 'w') { |f| f.write identicon.to_blob }
    identicon.write path_w

    digest = Proc.new { |path| Digest::MD5.hexdigest(IO.read(path)) }
    assert_equal digest.call(path_w), digest.call(path_w)

    File.unlink path_b, path_w
  end

  def test_size_opt
    size = 100
    identicon = Scarf::Identicon.new 'foo', :size => size
    assert_include identicon.instance_variable_get(:@image).instance_variable_get(:@head), 'viewBox="0 0 100.0 100.0"'
  end
end
