require 'oystercard'

describe Oystercard do
  
  it 'checks that default balance is zero' do
    expect(subject.balance).to eq (0)
  end

  it 'can add to the balance' do
    #subject.top_up(5)
    #expect(subject.balance).to eq(5)
    expect{ subject.top_up(5) }.to change{ subject.balance }.by 5
  end

  it 'raises error when balance is over 90' do
    expect{ subject.top_up(91) }.to raise_error "Maximum balance of #{Oystercard::MAXIMUM_BALANCE} exceeded"
  end

  it 'can deduct from the balance' do
    expect{ subject.deduct(5) }.to change{ subject.balance }.by -5
  end

  it 'touches in' do
    subject.top_up(Oystercard::MAXIMUM_BALANCE)
    subject.touch_in
    expect(subject.in_journey).to eq (true)
  end

  it 'raises an error when touching in with insufficient balance' do
    expect{ subject.touch_in }.to raise_error "Insufficent balance"
  end

  it 'touches out' do
    subject.top_up(Oystercard::MAXIMUM_BALANCE)
    subject.touch_in
    subject.touch_out
    expect(subject.in_journey).to eq (false)
  end

  

end