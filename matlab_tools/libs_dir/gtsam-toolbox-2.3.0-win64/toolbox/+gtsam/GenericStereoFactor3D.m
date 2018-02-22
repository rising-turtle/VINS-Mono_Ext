%class GenericStereoFactor3D, see Doxygen page for details
%at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
%
%-------Constructors-------
%GenericStereoFactor3D(StereoPoint2 measured, Base noiseModel, size_t poseKey, size_t landmarkKey, Cal3_S2Stereo K)
%
%-------Methods-------
%active(Values c) : returns bool
%calibration() : returns gtsam::Cal3_S2Stereo
%clone() : returns gtsam::NonlinearFactor
%dim() : returns size_t
%equals(NonlinearFactor other, double tol) : returns void
%error(Values c) : returns double
%keys() : returns gtsam::KeyVector
%linearize(Values c, Ordering ordering) : returns gtsam::GaussianFactor
%measured() : returns gtsam::StereoPoint2
%print(string s) : returns void
%printKeys(string s) : returns void
%size() : returns size_t
%
classdef GenericStereoFactor3D < gtsam.NonlinearFactor
  properties
    ptr_gtsamGenericStereoFactor3D = 0
  end
  methods
    function obj = GenericStereoFactor3D(varargin)
      if (nargin == 2 || (nargin == 3 && strcmp(varargin{3}, 'void'))) && isa(varargin{1}, 'uint64') && varargin{1} == uint64(5139824614673773682)
        if nargin == 2
          my_ptr = varargin{2};
        else
          my_ptr = gtsam_wrapper(2052, varargin{2});
        end
        base_ptr = gtsam_wrapper(2051, my_ptr);
      elseif nargin == 5 && isa(varargin{1},'gtsam.StereoPoint2') && isa(varargin{2},'gtsam.noiseModel.Base') && isa(varargin{3},'numeric') && isa(varargin{4},'numeric') && isa(varargin{5},'gtsam.Cal3_S2Stereo')
        [ my_ptr, base_ptr ] = gtsam_wrapper(2053, varargin{1}, varargin{2}, varargin{3}, varargin{4}, varargin{5});
      else
        error('Arguments do not match any overload of gtsam.GenericStereoFactor3D constructor');
      end
      obj = obj@gtsam.NonlinearFactor(uint64(5139824614673773682), base_ptr);
      obj.ptr_gtsamGenericStereoFactor3D = my_ptr;
    end

    function delete(obj)
      gtsam_wrapper(2054, obj.ptr_gtsamGenericStereoFactor3D);
    end

    function display(obj), obj.print(''); end
    %DISPLAY Calls print on the object
    function disp(obj), obj.display; end
    %DISP Calls print on the object
    function varargout = active(this, varargin)
      % ACTIVE usage: active(Values c) : returns bool
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % active(Values c)
      if length(varargin) == 1 && isa(varargin{1},'gtsam.Values')
        varargout{1} = gtsam_wrapper(2055, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.GenericStereoFactor3D.active');
      end
    end

    function varargout = calibration(this, varargin)
      % CALIBRATION usage: calibration() : returns gtsam::Cal3_S2Stereo
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % calibration()
      if length(varargin) == 0
        varargout{1} = gtsam_wrapper(2056, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.GenericStereoFactor3D.calibration');
      end
    end

    function varargout = clone(this, varargin)
      % CLONE usage: clone() : returns gtsam::NonlinearFactor
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % clone()
      if length(varargin) == 0
        varargout{1} = gtsam_wrapper(2057, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.GenericStereoFactor3D.clone');
      end
    end

    function varargout = dim(this, varargin)
      % DIM usage: dim() : returns size_t
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % dim()
      if length(varargin) == 0
        varargout{1} = gtsam_wrapper(2058, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.GenericStereoFactor3D.dim');
      end
    end

    function varargout = equals(this, varargin)
      % EQUALS usage: equals(NonlinearFactor other, double tol) : returns void
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % equals(NonlinearFactor other, double tol)
      if length(varargin) == 2 && isa(varargin{1},'gtsam.NonlinearFactor') && isa(varargin{2},'double')
        gtsam_wrapper(2059, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.GenericStereoFactor3D.equals');
      end
    end

    function varargout = error(this, varargin)
      % ERROR usage: error(Values c) : returns double
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % error(Values c)
      if length(varargin) == 1 && isa(varargin{1},'gtsam.Values')
        varargout{1} = gtsam_wrapper(2060, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.GenericStereoFactor3D.error');
      end
    end

    function varargout = keys(this, varargin)
      % KEYS usage: keys() : returns gtsam::KeyVector
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % keys()
      if length(varargin) == 0
        varargout{1} = gtsam_wrapper(2061, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.GenericStereoFactor3D.keys');
      end
    end

    function varargout = linearize(this, varargin)
      % LINEARIZE usage: linearize(Values c, Ordering ordering) : returns gtsam::GaussianFactor
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % linearize(Values c, Ordering ordering)
      if length(varargin) == 2 && isa(varargin{1},'gtsam.Values') && isa(varargin{2},'gtsam.Ordering')
        varargout{1} = gtsam_wrapper(2062, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.GenericStereoFactor3D.linearize');
      end
    end

    function varargout = measured(this, varargin)
      % MEASURED usage: measured() : returns gtsam::StereoPoint2
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % measured()
      if length(varargin) == 0
        varargout{1} = gtsam_wrapper(2063, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.GenericStereoFactor3D.measured');
      end
    end

    function varargout = print(this, varargin)
      % PRINT usage: print(string s) : returns void
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % print(string s)
      if length(varargin) == 1 && isa(varargin{1},'char')
        gtsam_wrapper(2064, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.GenericStereoFactor3D.print');
      end
    end

    function varargout = printKeys(this, varargin)
      % PRINTKEYS usage: printKeys(string s) : returns void
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % printKeys(string s)
      if length(varargin) == 1 && isa(varargin{1},'char')
        gtsam_wrapper(2065, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.GenericStereoFactor3D.printKeys');
      end
    end

    function varargout = size(this, varargin)
      % SIZE usage: size() : returns size_t
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % size()
      if length(varargin) == 0
        varargout{1} = gtsam_wrapper(2066, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.GenericStereoFactor3D.size');
      end
    end

  end

  methods(Static = true)
  end
end
