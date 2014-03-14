require 'test_helper'

describe JSWrapper do
  it "should be able to call javascript methods" do
    method_called = false

    js_object = %x| {
        call_method: function() {
          method_called = true;
        }
      }
    |

    wrapper = JSWrapper.new(js_object)
    wrapper.call_method
    method_called.should == true
    expect(method_called).to be(true)
  end

  it "excepts arguments" do
    arg_passed = nil

    js_object = %x| {
        call_method: function(arg) {
          arg_passed = arg;
        }
      }
    |

    wrapper = JSWrapper.new(js_object)
    wrapper.call_method("pass")
    expect(arg_passed).to eq("pass")
  end
end
