%class LieMatrix, see Doxygen page for details
%at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
%
%-------Constructors-------
%LieMatrix()
%LieMatrix(Matrix v)
%
%-------Methods-------
%between(LieMatrix l2) : returns gtsam::LieMatrix
%compose(LieMatrix p) : returns gtsam::LieMatrix
%dim() : returns size_t
%equals(LieMatrix expected, double tol) : returns bool
%inverse() : returns gtsam::LieMatrix
%localCoordinates(LieMatrix t2) : returns Vector
%matrix() : returns Matrix
%print(string s) : returns void
%retract(Vector v) : returns gtsam::LieMatrix
%
%-------Static Methods-------
%Expmap(Vector v) : returns gtsam::LieMatrix
%Logmap(LieMatrix p) : returns Vector
%identity() : returns gtsam::LieMatrix
%
classdef LieMatrix < gtsam.Value
  properties
    ptr_gtsamLieMatrix = 0
  end
  methods
    function obj = LieMatrix(varargin)
      if (nargin == 2 || (nargin == 3 && strcmp(varargin{3}, 'void'))) && isa(varargin{1}, 'uint64') && varargin{1} == uint64(5139824614673773682)
        if nargin == 2
          my_ptr = varargin{2};
        else
          my_ptr = gtsam_wrapper(40, varargin{2});
        end
        base_ptr = gtsam_wrapper(39, my_ptr);
      elseif nargin == 0
        [ my_ptr, base_ptr ] = gtsam_wrapper(41);
      elseif nargin == 1 && isa(varargin{1},'double')
        [ my_ptr, base_ptr ] = gtsam_wrapper(42, varargin{1});
      else
        error('Arguments do not match any overload of gtsam.LieMatrix constructor');
      end
      obj = obj@gtsam.Value(uint64(5139824614673773682), base_ptr);
      obj.ptr_gtsamLieMatrix = my_ptr;
    end

    function delete(obj)
      gtsam_wrapper(43, obj.ptr_gtsamLieMatrix);
    end

    function display(obj), obj.print(''); end
    %DISPLAY Calls print on the object
    function disp(obj), obj.display; end
    %DISP Calls print on the object
    function varargout = between(this, varargin)
      % BETWEEN usage: between(LieMatrix l2) : returns gtsam::LieMatrix
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % between(LieMatrix l2)
      if length(varargin) == 1 && isa(varargin{1},'gtsam.LieMatrix')
        varargout{1} = gtsam_wrapper(44, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.LieMatrix.between');
      end
    end

    function varargout = compose(this, varargin)
      % COMPOSE usage: compose(LieMatrix p) : returns gtsam::LieMatrix
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % compose(LieMatrix p)
      if length(varargin) == 1 && isa(varargin{1},'gtsam.LieMatrix')
        varargout{1} = gtsam_wrapper(45, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.LieMatrix.compose');
      end
    end

    function varargout = dim(this, varargin)
      % DIM usage: dim() : returns size_t
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % dim()
      if length(varargin) == 0
        varargout{1} = gtsam_wrapper(46, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.LieMatrix.dim');
      end
    end

    function varargout = equals(this, varargin)
      % EQUALS usage: equals(LieMatrix expected, double tol) : returns bool
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % equals(LieMatrix expected, double tol)
      if length(varargin) == 2 && isa(varargin{1},'gtsam.LieMatrix') && isa(varargin{2},'double')
        varargout{1} = gtsam_wrapper(47, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.LieMatrix.equals');
      end
    end

    function varargout = inverse(this, varargin)
      % INVERSE usage: inverse() : returns gtsam::LieMatrix
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % inverse()
      if length(varargin) == 0
        varargout{1} = gtsam_wrapper(48, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.LieMatrix.inverse');
      end
    end

    function varargout = localCoordinates(this, varargin)
      % LOCALCOORDINATES usage: localCoordinates(LieMatrix t2) : returns Vector
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % localCoordinates(LieMatrix t2)
      if length(varargin) == 1 && isa(varargin{1},'gtsam.LieMatrix')
        varargout{1} = gtsam_wrapper(49, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.LieMatrix.localCoordinates');
      end
    end

    function varargout = matrix(this, varargin)
      % MATRIX usage: matrix() : returns Matrix
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % matrix()
      if length(varargin) == 0
        varargout{1} = gtsam_wrapper(50, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.LieMatrix.matrix');
      end
    end

    function varargout = print(this, varargin)
      % PRINT usage: print(string s) : returns void
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % print(string s)
      if length(varargin) == 1 && isa(varargin{1},'char')
        gtsam_wrapper(51, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.LieMatrix.print');
      end
    end

    function varargout = retract(this, varargin)
      % RETRACT usage: retract(Vector v) : returns gtsam::LieMatrix
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % retract(Vector v)
      if length(varargin) == 1 && isa(varargin{1},'double')
        varargout{1} = gtsam_wrapper(52, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.LieMatrix.retract');
      end
    end

  end

  methods(Static = true)
    function varargout = Expmap(varargin)
      % EXPMAP usage: Expmap(Vector v) : returns gtsam::LieMatrix
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Usage
      % EXPMAP(Vector v)
      if length(varargin) == 1 && isa(varargin{1},'double')
        varargout{1} = gtsam_wrapper(53, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.LieMatrix.Expmap');
      end
    end

    function varargout = Logmap(varargin)
      % LOGMAP usage: Logmap(LieMatrix p) : returns Vector
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Usage
      % LOGMAP(LieMatrix p)
      if length(varargin) == 1 && isa(varargin{1},'gtsam.LieMatrix')
        varargout{1} = gtsam_wrapper(54, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.LieMatrix.Logmap');
      end
    end

    function varargout = Identity(varargin)
      % IDENTITY usage: identity() : returns gtsam::LieMatrix
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Usage
      % IDENTITY()
      if length(varargin) == 0
        varargout{1} = gtsam_wrapper(55, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.LieMatrix.Identity');
      end
    end

  end
end
