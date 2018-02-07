%class GaussianFactor, see Doxygen page for details
%at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
%
%-------Methods-------
%augmentedInformation() : returns Matrix
%equals(GaussianFactor lf, double tol) : returns bool
%error(VectorValues c) : returns double
%information() : returns Matrix
%negate() : returns gtsam::GaussianFactor
%print(string s) : returns void
%size() : returns size_t
%
classdef GaussianFactor < handle
  properties
    ptr_gtsamGaussianFactor = 0
  end
  methods
    function obj = GaussianFactor(varargin)
      if (nargin == 2 || (nargin == 3 && strcmp(varargin{3}, 'void'))) && isa(varargin{1}, 'uint64') && varargin{1} == uint64(5139824614673773682)
        if nargin == 2
          my_ptr = varargin{2};
        else
          my_ptr = gtsam_wrapper(625, varargin{2});
        end
        gtsam_wrapper(624, my_ptr);
      else
        error('Arguments do not match any overload of gtsam.GaussianFactor constructor');
      end
      obj.ptr_gtsamGaussianFactor = my_ptr;
    end

    function delete(obj)
      gtsam_wrapper(626, obj.ptr_gtsamGaussianFactor);
    end

    function display(obj), obj.print(''); end
    %DISPLAY Calls print on the object
    function disp(obj), obj.display; end
    %DISP Calls print on the object
    function varargout = augmentedInformation(this, varargin)
      % AUGMENTEDINFORMATION usage: augmentedInformation() : returns Matrix
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % augmentedInformation()
      if length(varargin) == 0
        varargout{1} = gtsam_wrapper(627, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.GaussianFactor.augmentedInformation');
      end
    end

    function varargout = equals(this, varargin)
      % EQUALS usage: equals(GaussianFactor lf, double tol) : returns bool
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % equals(GaussianFactor lf, double tol)
      if length(varargin) == 2 && isa(varargin{1},'gtsam.GaussianFactor') && isa(varargin{2},'double')
        varargout{1} = gtsam_wrapper(628, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.GaussianFactor.equals');
      end
    end

    function varargout = error(this, varargin)
      % ERROR usage: error(VectorValues c) : returns double
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % error(VectorValues c)
      if length(varargin) == 1 && isa(varargin{1},'gtsam.VectorValues')
        varargout{1} = gtsam_wrapper(629, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.GaussianFactor.error');
      end
    end

    function varargout = information(this, varargin)
      % INFORMATION usage: information() : returns Matrix
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % information()
      if length(varargin) == 0
        varargout{1} = gtsam_wrapper(630, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.GaussianFactor.information');
      end
    end

    function varargout = negate(this, varargin)
      % NEGATE usage: negate() : returns gtsam::GaussianFactor
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % negate()
      if length(varargin) == 0
        varargout{1} = gtsam_wrapper(631, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.GaussianFactor.negate');
      end
    end

    function varargout = print(this, varargin)
      % PRINT usage: print(string s) : returns void
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % print(string s)
      if length(varargin) == 1 && isa(varargin{1},'char')
        gtsam_wrapper(632, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.GaussianFactor.print');
      end
    end

    function varargout = size(this, varargin)
      % SIZE usage: size() : returns size_t
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % size()
      if length(varargin) == 0
        varargout{1} = gtsam_wrapper(633, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.GaussianFactor.size');
      end
    end

  end

  methods(Static = true)
  end
end
