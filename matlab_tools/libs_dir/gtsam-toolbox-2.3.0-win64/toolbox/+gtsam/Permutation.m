%class Permutation, see Doxygen page for details
%at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
%
%-------Constructors-------
%Permutation()
%Permutation(size_t nVars)
%
%-------Methods-------
%at(size_t variable) : returns size_t
%empty() : returns bool
%equals(Permutation rhs, double tol) : returns bool
%inverse() : returns gtsam::Permutation
%permute(Permutation permutation) : returns gtsam::Permutation
%print(string s) : returns void
%resize(size_t newSize) : returns void
%size() : returns size_t
%
%-------Static Methods-------
%Identity(size_t nVars) : returns gtsam::Permutation
%
classdef Permutation < handle
  properties
    ptr_gtsamPermutation = 0
  end
  methods
    function obj = Permutation(varargin)
      if nargin == 2 && isa(varargin{1}, 'uint64') && varargin{1} == uint64(5139824614673773682)
        my_ptr = varargin{2};
        gtsam_wrapper(381, my_ptr);
      elseif nargin == 0
        my_ptr = gtsam_wrapper(382);
      elseif nargin == 1 && isa(varargin{1},'numeric')
        my_ptr = gtsam_wrapper(383, varargin{1});
      else
        error('Arguments do not match any overload of gtsam.Permutation constructor');
      end
      obj.ptr_gtsamPermutation = my_ptr;
    end

    function delete(obj)
      gtsam_wrapper(384, obj.ptr_gtsamPermutation);
    end

    function display(obj), obj.print(''); end
    %DISPLAY Calls print on the object
    function disp(obj), obj.display; end
    %DISP Calls print on the object
    function varargout = at(this, varargin)
      % AT usage: at(size_t variable) : returns size_t
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % at(size_t variable)
      if length(varargin) == 1 && isa(varargin{1},'numeric')
        varargout{1} = gtsam_wrapper(385, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.Permutation.at');
      end
    end

    function varargout = empty(this, varargin)
      % EMPTY usage: empty() : returns bool
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % empty()
      if length(varargin) == 0
        varargout{1} = gtsam_wrapper(386, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.Permutation.empty');
      end
    end

    function varargout = equals(this, varargin)
      % EQUALS usage: equals(Permutation rhs, double tol) : returns bool
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % equals(Permutation rhs, double tol)
      if length(varargin) == 2 && isa(varargin{1},'gtsam.Permutation') && isa(varargin{2},'double')
        varargout{1} = gtsam_wrapper(387, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.Permutation.equals');
      end
    end

    function varargout = inverse(this, varargin)
      % INVERSE usage: inverse() : returns gtsam::Permutation
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % inverse()
      if length(varargin) == 0
        varargout{1} = gtsam_wrapper(388, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.Permutation.inverse');
      end
    end

    function varargout = permute(this, varargin)
      % PERMUTE usage: permute(Permutation permutation) : returns gtsam::Permutation
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % permute(Permutation permutation)
      if length(varargin) == 1 && isa(varargin{1},'gtsam.Permutation')
        varargout{1} = gtsam_wrapper(389, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.Permutation.permute');
      end
    end

    function varargout = print(this, varargin)
      % PRINT usage: print(string s) : returns void
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % print(string s)
      if length(varargin) == 1 && isa(varargin{1},'char')
        gtsam_wrapper(390, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.Permutation.print');
      end
    end

    function varargout = resize(this, varargin)
      % RESIZE usage: resize(size_t newSize) : returns void
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % resize(size_t newSize)
      if length(varargin) == 1 && isa(varargin{1},'numeric')
        gtsam_wrapper(391, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.Permutation.resize');
      end
    end

    function varargout = size(this, varargin)
      % SIZE usage: size() : returns size_t
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % size()
      if length(varargin) == 0
        varargout{1} = gtsam_wrapper(392, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.Permutation.size');
      end
    end

  end

  methods(Static = true)
    function varargout = Identity(varargin)
      % IDENTITY usage: Identity(size_t nVars) : returns gtsam::Permutation
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Usage
      % IDENTITY(size_t nVars)
      if length(varargin) == 1 && isa(varargin{1},'numeric')
        varargout{1} = gtsam_wrapper(393, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.Permutation.Identity');
      end
    end

  end
end
