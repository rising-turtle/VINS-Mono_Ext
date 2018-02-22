%class KeyList, see Doxygen page for details
%at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
%
%-------Constructors-------
%KeyList()
%KeyList(KeyList other)
%
%-------Methods-------
%back() : returns size_t
%clear() : returns void
%empty() : returns bool
%front() : returns size_t
%pop_back() : returns void
%pop_front() : returns void
%push_back(size_t key) : returns void
%push_front(size_t key) : returns void
%remove(size_t key) : returns void
%size() : returns size_t
%sort() : returns void
%
classdef KeyList < handle
  properties
    ptr_gtsamKeyList = 0
  end
  methods
    function obj = KeyList(varargin)
      if nargin == 2 && isa(varargin{1}, 'uint64') && varargin{1} == uint64(5139824614673773682)
        my_ptr = varargin{2};
        gtsam_wrapper(888, my_ptr);
      elseif nargin == 0
        my_ptr = gtsam_wrapper(889);
      elseif nargin == 1 && isa(varargin{1},'gtsam.KeyList')
        my_ptr = gtsam_wrapper(890, varargin{1});
      else
        error('Arguments do not match any overload of gtsam.KeyList constructor');
      end
      obj.ptr_gtsamKeyList = my_ptr;
    end

    function delete(obj)
      gtsam_wrapper(891, obj.ptr_gtsamKeyList);
    end

    function display(obj), obj.print(''); end
    %DISPLAY Calls print on the object
    function disp(obj), obj.display; end
    %DISP Calls print on the object
    function varargout = back(this, varargin)
      % BACK usage: back() : returns size_t
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % back()
      if length(varargin) == 0
        varargout{1} = gtsam_wrapper(892, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.KeyList.back');
      end
    end

    function varargout = clear(this, varargin)
      % CLEAR usage: clear() : returns void
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % clear()
      if length(varargin) == 0
        gtsam_wrapper(893, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.KeyList.clear');
      end
    end

    function varargout = empty(this, varargin)
      % EMPTY usage: empty() : returns bool
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % empty()
      if length(varargin) == 0
        varargout{1} = gtsam_wrapper(894, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.KeyList.empty');
      end
    end

    function varargout = front(this, varargin)
      % FRONT usage: front() : returns size_t
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % front()
      if length(varargin) == 0
        varargout{1} = gtsam_wrapper(895, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.KeyList.front');
      end
    end

    function varargout = pop_back(this, varargin)
      % POP_BACK usage: pop_back() : returns void
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % pop_back()
      if length(varargin) == 0
        gtsam_wrapper(896, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.KeyList.pop_back');
      end
    end

    function varargout = pop_front(this, varargin)
      % POP_FRONT usage: pop_front() : returns void
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % pop_front()
      if length(varargin) == 0
        gtsam_wrapper(897, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.KeyList.pop_front');
      end
    end

    function varargout = push_back(this, varargin)
      % PUSH_BACK usage: push_back(size_t key) : returns void
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % push_back(size_t key)
      if length(varargin) == 1 && isa(varargin{1},'numeric')
        gtsam_wrapper(898, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.KeyList.push_back');
      end
    end

    function varargout = push_front(this, varargin)
      % PUSH_FRONT usage: push_front(size_t key) : returns void
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % push_front(size_t key)
      if length(varargin) == 1 && isa(varargin{1},'numeric')
        gtsam_wrapper(899, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.KeyList.push_front');
      end
    end

    function varargout = remove(this, varargin)
      % REMOVE usage: remove(size_t key) : returns void
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % remove(size_t key)
      if length(varargin) == 1 && isa(varargin{1},'numeric')
        gtsam_wrapper(900, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.KeyList.remove');
      end
    end

    function varargout = size(this, varargin)
      % SIZE usage: size() : returns size_t
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % size()
      if length(varargin) == 0
        varargout{1} = gtsam_wrapper(901, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.KeyList.size');
      end
    end

    function varargout = sort(this, varargin)
      % SORT usage: sort() : returns void
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % sort()
      if length(varargin) == 0
        gtsam_wrapper(902, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.KeyList.sort');
      end
    end

  end

  methods(Static = true)
  end
end
