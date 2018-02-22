%class LieVector, see Doxygen page for details
%at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
%
%-------Constructors-------
%LieVector()
%LieVector(Vector v)
%
%-------Methods-------
%between(LieVector l2) : returns gtsam::LieVector
%compose(LieVector p) : returns gtsam::LieVector
%dim() : returns size_t
%equals(LieVector expected, double tol) : returns bool
%inverse() : returns gtsam::LieVector
%localCoordinates(LieVector t2) : returns Vector
%print(string s) : returns void
%retract(Vector v) : returns gtsam::LieVector
%vector() : returns Vector
%
%-------Static Methods-------
%Expmap(Vector v) : returns gtsam::LieVector
%Logmap(LieVector p) : returns Vector
%identity() : returns gtsam::LieVector
%
classdef LieVector < gtsam.Value
  properties
    ptr_gtsamLieVector = 0
  end
  methods
    function obj = LieVector(varargin)
      if (nargin == 2 || (nargin == 3 && strcmp(varargin{3}, 'void'))) && isa(varargin{1}, 'uint64') && varargin{1} == uint64(5139824614673773682)
        if nargin == 2
          my_ptr = varargin{2};
        else
          my_ptr = gtsam_wrapper(23, varargin{2});
        end
        base_ptr = gtsam_wrapper(22, my_ptr);
      elseif nargin == 0
        [ my_ptr, base_ptr ] = gtsam_wrapper(24);
      elseif nargin == 1 && isa(varargin{1},'double')
        [ my_ptr, base_ptr ] = gtsam_wrapper(25, varargin{1});
      else
        error('Arguments do not match any overload of gtsam.LieVector constructor');
      end
      obj = obj@gtsam.Value(uint64(5139824614673773682), base_ptr);
      obj.ptr_gtsamLieVector = my_ptr;
    end

    function delete(obj)
      gtsam_wrapper(26, obj.ptr_gtsamLieVector);
    end

    function display(obj), obj.print(''); end
    %DISPLAY Calls print on the object
    function disp(obj), obj.display; end
    %DISP Calls print on the object
    function varargout = between(this, varargin)
      % BETWEEN usage: between(LieVector l2) : returns gtsam::LieVector
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % between(LieVector l2)
      if length(varargin) == 1 && isa(varargin{1},'gtsam.LieVector')
        varargout{1} = gtsam_wrapper(27, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.LieVector.between');
      end
    end

    function varargout = compose(this, varargin)
      % COMPOSE usage: compose(LieVector p) : returns gtsam::LieVector
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % compose(LieVector p)
      if length(varargin) == 1 && isa(varargin{1},'gtsam.LieVector')
        varargout{1} = gtsam_wrapper(28, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.LieVector.compose');
      end
    end

    function varargout = dim(this, varargin)
      % DIM usage: dim() : returns size_t
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % dim()
      if length(varargin) == 0
        varargout{1} = gtsam_wrapper(29, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.LieVector.dim');
      end
    end

    function varargout = equals(this, varargin)
      % EQUALS usage: equals(LieVector expected, double tol) : returns bool
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % equals(LieVector expected, double tol)
      if length(varargin) == 2 && isa(varargin{1},'gtsam.LieVector') && isa(varargin{2},'double')
        varargout{1} = gtsam_wrapper(30, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.LieVector.equals');
      end
    end

    function varargout = inverse(this, varargin)
      % INVERSE usage: inverse() : returns gtsam::LieVector
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % inverse()
      if length(varargin) == 0
        varargout{1} = gtsam_wrapper(31, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.LieVector.inverse');
      end
    end

    function varargout = localCoordinates(this, varargin)
      % LOCALCOORDINATES usage: localCoordinates(LieVector t2) : returns Vector
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % localCoordinates(LieVector t2)
      if length(varargin) == 1 && isa(varargin{1},'gtsam.LieVector')
        varargout{1} = gtsam_wrapper(32, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.LieVector.localCoordinates');
      end
    end

    function varargout = print(this, varargin)
      % PRINT usage: print(string s) : returns void
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % print(string s)
      if length(varargin) == 1 && isa(varargin{1},'char')
        gtsam_wrapper(33, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.LieVector.print');
      end
    end

    function varargout = retract(this, varargin)
      % RETRACT usage: retract(Vector v) : returns gtsam::LieVector
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % retract(Vector v)
      if length(varargin) == 1 && isa(varargin{1},'double')
        varargout{1} = gtsam_wrapper(34, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.LieVector.retract');
      end
    end

    function varargout = vector(this, varargin)
      % VECTOR usage: vector() : returns Vector
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % vector()
      if length(varargin) == 0
        varargout{1} = gtsam_wrapper(35, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.LieVector.vector');
      end
    end

  end

  methods(Static = true)
    function varargout = Expmap(varargin)
      % EXPMAP usage: Expmap(Vector v) : returns gtsam::LieVector
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Usage
      % EXPMAP(Vector v)
      if length(varargin) == 1 && isa(varargin{1},'double')
        varargout{1} = gtsam_wrapper(36, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.LieVector.Expmap');
      end
    end

    function varargout = Logmap(varargin)
      % LOGMAP usage: Logmap(LieVector p) : returns Vector
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Usage
      % LOGMAP(LieVector p)
      if length(varargin) == 1 && isa(varargin{1},'gtsam.LieVector')
        varargout{1} = gtsam_wrapper(37, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.LieVector.Logmap');
      end
    end

    function varargout = Identity(varargin)
      % IDENTITY usage: identity() : returns gtsam::LieVector
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Usage
      % IDENTITY()
      if length(varargin) == 0
        varargout{1} = gtsam_wrapper(38, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.LieVector.Identity');
      end
    end

  end
end
