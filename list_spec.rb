require './node.rb'

describe '#create' do
  it 'should set payload' do
    payload = 'bla'
    node = create(payload)
    expect(node.payload).to eql(payload)
    expect(node.prev).to eql(nil)
    expect(node.next).to eql(nil)
  end

  it 'creates two interlinked nodes' do
    first = create(1)
    second = add_after(first, 2)
    
    expect(first.prev).to eql(nil)
    expect(first.next).to eql(second)

    expect(second.prev).to eql(first)
    expect(second.next).to eql(nil)
  end

  it 'creates adds node in the middle.' do
    first = create(1)
    last = add_after(first, 3)
    middle = add_after(first, 2)
    
    expect(first.prev).to eql(nil)
    expect(first.next).to eql(middle)

    expect(middle.prev).to eql(first)
    expect(middle.next).to eql(last)

    expect(last.prev).to eql(middle)
    expect(last.next).to eql(nil)
  end
end



