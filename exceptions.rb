# frozen_string_literal: true

# Custom exceptions here

class LibraryError < StandardError

end

class BookNotFoundError < LibraryError

end

class MemberNotFoundError < LibraryError

end

class BookUnavailableError < LibraryError

end

class CheckoutLimitError < LibraryError

end

class BookAlreadyCheckedOutError  < LibraryError

end

class BookNotCheckedOutError < LibraryError

end

class WrongMemberError < LibraryError

end

class InvalidISBNError < LibraryError

end

class InvalidMemberIDError < LibraryError

end

class DuplicateBookError < LibraryError

end

class DuplicateMemberError < LibraryError

end

class OverdueBookError < LibraryError

end
