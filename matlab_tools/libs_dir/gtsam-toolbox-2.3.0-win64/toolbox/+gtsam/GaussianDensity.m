%class GaussianDensity, see Doxygen page for details
%at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
%
%-------Constructors-------
%GaussianDensity(size_t key, Vector d, Matrix R, Vector sigmas)
%
%-------Methods-------
%covariance() : returns Matrix
%information() : returns Matrix
%mean() : returns Vector
%print(string s) : returns void
%
classdef GaussianDensity < handle
  properties
    ptr_gtsamGaussianDensity = 0
  end
  methods
    function obj = GaussianDensity(varargin)
      if nargin == 2 && isa(varargin{1}, 'uint64') && varargin{1} == uint64(5139824614673773682)
        my_ptr = varargin{2};
        gtsam_wrapper(606, my_ptr);
      elseif nargin == 4 && isa(varargin{1},'numeric') && isa(varargin{2},'double') && isa(varargin{3},'double') && isa(varargin{4},'double')
        my_ptr = gtsam_wrapper(607, varargin{1}, varargin{2}, varargin{3}, varargin{4});
      else
        error('Arguments do not match any overload of gtsam.GaussianDensity constructor');
      end
      obj.ptr_gtsamGaussianDensity = my_ptr;
    end

    function delete(obj)
      gtsam_wrapper(608, obj.ptr_gtsamGaussianDensity);
    end

    function display(obj), obj.print(''); end
    %DISPLAY Calls print on the object
    function disp(obj), obj.display; end
    %DISP Calls print on the object
    function varargout = covariance(this, varargin)
      % COVARIANCE usage: covariance() : returns Matrix
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % covariance()
      if length(varargin) == 0
        varargout{1} = gtsam_wrapper(609, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.GaussianDensity.covariance');
      end
    end

    function varargout = information(this, varargin)
      % INFORMATION usage: information() : returns Matrix
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % information()
      if length(varargin) == 0
        varargout{1} = gtsam_wrapper(610, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.GaussianDensity.information');
      end
    end

    function varargout = mean(this, varargin)
      % MEAN usage: mean() : returns Vector
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % mean()
      if length(varargin) == 0
        varargout{1} = gtsam_wrapper(611, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.GaussianDensity.mean');
      end
    end

    function varargout = print(this, varargin)
      % PRINT usage: print(string s) : returns void
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % print(string s)
      if length(varargin) == 1 && isa(varargin{1},'char')
        gtsam_wrapper(612, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.GaussianDensity.print');
      end
    end

  end

  methods(Static = true)
  end
end
