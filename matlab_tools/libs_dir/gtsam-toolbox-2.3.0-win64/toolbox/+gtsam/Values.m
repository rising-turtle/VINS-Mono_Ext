%class Values, see Doxygen page for details
%at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
%
%-------Constructors-------
%Values()
%Values(Values other)
%
%-------Methods-------
%at(size_t j) : returns gtsam::Value
%clear() : returns void
%dim() : returns size_t
%empty() : returns bool
%equals(Values other, double tol) : returns bool
%erase(size_t j) : returns void
%exists(size_t j) : returns bool
%insert(size_t j, Value value) : returns void
%insert(Values values) : returns void
%keys() : returns gtsam::KeyList
%localCoordinates(Values cp, Ordering ordering) : returns gtsam::VectorValues
%localCoordinates(Values cp, Ordering ordering, VectorValues delta) : returns gtsam::VectorValues
%orderingArbitrary(size_t firstVar) : returns gtsam::Ordering
%print(string s) : returns void
%retract(VectorValues delta, Ordering ordering) : returns gtsam::Values
%size() : returns size_t
%swap(Values values) : returns void
%update(size_t j, Value val) : returns void
%update(Values values) : returns void
%zeroVectors(Ordering ordering) : returns gtsam::VectorValues
%
classdef Values < handle
  properties
    ptr_gtsamValues = 0
  end
  methods
    function obj = Values(varargin)
      if nargin == 2 && isa(varargin{1}, 'uint64') && varargin{1} == uint64(5139824614673773682)
        my_ptr = varargin{2};
        gtsam_wrapper(864, my_ptr);
      elseif nargin == 0
        my_ptr = gtsam_wrapper(865);
      elseif nargin == 1 && isa(varargin{1},'gtsam.Values')
        my_ptr = gtsam_wrapper(866, varargin{1});
      else
        error('Arguments do not match any overload of gtsam.Values constructor');
      end
      obj.ptr_gtsamValues = my_ptr;
    end

    function delete(obj)
      gtsam_wrapper(867, obj.ptr_gtsamValues);
    end

    function display(obj), obj.print(''); end
    %DISPLAY Calls print on the object
    function disp(obj), obj.display; end
    %DISP Calls print on the object
    function varargout = at(this, varargin)
      % AT usage: at(size_t j) : returns gtsam::Value
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % at(size_t j)
      if length(varargin) == 1 && isa(varargin{1},'numeric')
        varargout{1} = gtsam_wrapper(868, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.Values.at');
      end
    end

    function varargout = clear(this, varargin)
      % CLEAR usage: clear() : returns void
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % clear()
      if length(varargin) == 0
        gtsam_wrapper(869, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.Values.clear');
      end
    end

    function varargout = dim(this, varargin)
      % DIM usage: dim() : returns size_t
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % dim()
      if length(varargin) == 0
        varargout{1} = gtsam_wrapper(870, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.Values.dim');
      end
    end

    function varargout = empty(this, varargin)
      % EMPTY usage: empty() : returns bool
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % empty()
      if length(varargin) == 0
        varargout{1} = gtsam_wrapper(871, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.Values.empty');
      end
    end

    function varargout = equals(this, varargin)
      % EQUALS usage: equals(Values other, double tol) : returns bool
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % equals(Values other, double tol)
      if length(varargin) == 2 && isa(varargin{1},'gtsam.Values') && isa(varargin{2},'double')
        varargout{1} = gtsam_wrapper(872, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.Values.equals');
      end
    end

    function varargout = erase(this, varargin)
      % ERASE usage: erase(size_t j) : returns void
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % erase(size_t j)
      if length(varargin) == 1 && isa(varargin{1},'numeric')
        gtsam_wrapper(873, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.Values.erase');
      end
    end

    function varargout = exists(this, varargin)
      % EXISTS usage: exists(size_t j) : returns bool
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % exists(size_t j)
      if length(varargin) == 1 && isa(varargin{1},'numeric')
        varargout{1} = gtsam_wrapper(874, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.Values.exists');
      end
    end

    function varargout = insert(this, varargin)
      % INSERT usage: insert(size_t j, Value value),  insert(Values values) : returns void
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % insert(size_t j, Value value)
      % insert(Values values)
      if length(varargin) == 2 && isa(varargin{1},'numeric') && isa(varargin{2},'gtsam.Value')
        gtsam_wrapper(875, this, varargin{:});
      elseif length(varargin) == 1 && isa(varargin{1},'gtsam.Values')
        gtsam_wrapper(876, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.Values.insert');
      end
    end

    function varargout = keys(this, varargin)
      % KEYS usage: keys() : returns gtsam::KeyList
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % keys()
      if length(varargin) == 0
        varargout{1} = gtsam_wrapper(877, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.Values.keys');
      end
    end

    function varargout = localCoordinates(this, varargin)
      % LOCALCOORDINATES usage: localCoordinates(Values cp, Ordering ordering),  localCoordinates(Values cp, Ordering ordering, VectorValues delta) : returns gtsam::VectorValues
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % localCoordinates(Values cp, Ordering ordering)
      % localCoordinates(Values cp, Ordering ordering, VectorValues delta)
      if length(varargin) == 2 && isa(varargin{1},'gtsam.Values') && isa(varargin{2},'gtsam.Ordering')
        varargout{1} = gtsam_wrapper(878, this, varargin{:});
      elseif length(varargin) == 3 && isa(varargin{1},'gtsam.Values') && isa(varargin{2},'gtsam.Ordering') && isa(varargin{3},'gtsam.VectorValues')
        gtsam_wrapper(879, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.Values.localCoordinates');
      end
    end

    function varargout = orderingArbitrary(this, varargin)
      % ORDERINGARBITRARY usage: orderingArbitrary(size_t firstVar) : returns gtsam::Ordering
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % orderingArbitrary(size_t firstVar)
      if length(varargin) == 1 && isa(varargin{1},'numeric')
        varargout{1} = gtsam_wrapper(880, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.Values.orderingArbitrary');
      end
    end

    function varargout = print(this, varargin)
      % PRINT usage: print(string s) : returns void
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % print(string s)
      if length(varargin) == 1 && isa(varargin{1},'char')
        gtsam_wrapper(881, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.Values.print');
      end
    end

    function varargout = retract(this, varargin)
      % RETRACT usage: retract(VectorValues delta, Ordering ordering) : returns gtsam::Values
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % retract(VectorValues delta, Ordering ordering)
      if length(varargin) == 2 && isa(varargin{1},'gtsam.VectorValues') && isa(varargin{2},'gtsam.Ordering')
        varargout{1} = gtsam_wrapper(882, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.Values.retract');
      end
    end

    function varargout = size(this, varargin)
      % SIZE usage: size() : returns size_t
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % size()
      if length(varargin) == 0
        varargout{1} = gtsam_wrapper(883, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.Values.size');
      end
    end

    function varargout = swap(this, varargin)
      % SWAP usage: swap(Values values) : returns void
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % swap(Values values)
      if length(varargin) == 1 && isa(varargin{1},'gtsam.Values')
        gtsam_wrapper(884, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.Values.swap');
      end
    end

    function varargout = update(this, varargin)
      % UPDATE usage: update(size_t j, Value val),  update(Values values) : returns void
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % update(size_t j, Value val)
      % update(Values values)
      if length(varargin) == 2 && isa(varargin{1},'numeric') && isa(varargin{2},'gtsam.Value')
        gtsam_wrapper(885, this, varargin{:});
      elseif length(varargin) == 1 && isa(varargin{1},'gtsam.Values')
        gtsam_wrapper(886, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.Values.update');
      end
    end

    function varargout = zeroVectors(this, varargin)
      % ZEROVECTORS usage: zeroVectors(Ordering ordering) : returns gtsam::VectorValues
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % zeroVectors(Ordering ordering)
      if length(varargin) == 1 && isa(varargin{1},'gtsam.Ordering')
        varargout{1} = gtsam_wrapper(887, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.Values.zeroVectors');
      end
    end

  end

  methods(Static = true)
  end
end
