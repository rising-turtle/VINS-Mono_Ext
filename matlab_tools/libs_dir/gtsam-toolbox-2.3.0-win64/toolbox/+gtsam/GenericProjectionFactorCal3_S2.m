%class GenericProjectionFactorCal3_S2, see Doxygen page for details
%at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
%
%-------Constructors-------
%GenericProjectionFactorCal3_S2(Point2 measured, Base noiseModel, size_t poseKey, size_t pointKey, Cal3_S2 k)
%GenericProjectionFactorCal3_S2(Point2 measured, Base noiseModel, size_t poseKey, size_t pointKey, Cal3_S2 k, Pose3 body_P_sensor)
%GenericProjectionFactorCal3_S2(Point2 measured, Base noiseModel, size_t poseKey, size_t pointKey, Cal3_S2 k, bool throwCheirality, bool verboseCheirality)
%GenericProjectionFactorCal3_S2(Point2 measured, Base noiseModel, size_t poseKey, size_t pointKey, Cal3_S2 k, bool throwCheirality, bool verboseCheirality, Pose3 body_P_sensor)
%
%-------Methods-------
%active(Values c) : returns bool
%calibration() : returns gtsam::Cal3_S2
%clone() : returns gtsam::NonlinearFactor
%dim() : returns size_t
%equals(NonlinearFactor other, double tol) : returns void
%error(Values c) : returns double
%keys() : returns gtsam::KeyVector
%linearize(Values c, Ordering ordering) : returns gtsam::GaussianFactor
%measured() : returns gtsam::Point2
%print(string s) : returns void
%printKeys(string s) : returns void
%size() : returns size_t
%throwCheirality() : returns bool
%verboseCheirality() : returns bool
%
classdef GenericProjectionFactorCal3_S2 < gtsam.NonlinearFactor
  properties
    ptr_gtsamGenericProjectionFactorCal3_S2 = 0
  end
  methods
    function obj = GenericProjectionFactorCal3_S2(varargin)
      if (nargin == 2 || (nargin == 3 && strcmp(varargin{3}, 'void'))) && isa(varargin{1}, 'uint64') && varargin{1} == uint64(5139824614673773682)
        if nargin == 2
          my_ptr = varargin{2};
        else
          my_ptr = gtsam_wrapper(1980, varargin{2});
        end
        base_ptr = gtsam_wrapper(1979, my_ptr);
      elseif nargin == 5 && isa(varargin{1},'gtsam.Point2') && isa(varargin{2},'gtsam.noiseModel.Base') && isa(varargin{3},'numeric') && isa(varargin{4},'numeric') && isa(varargin{5},'gtsam.Cal3_S2')
        [ my_ptr, base_ptr ] = gtsam_wrapper(1981, varargin{1}, varargin{2}, varargin{3}, varargin{4}, varargin{5});
      elseif nargin == 6 && isa(varargin{1},'gtsam.Point2') && isa(varargin{2},'gtsam.noiseModel.Base') && isa(varargin{3},'numeric') && isa(varargin{4},'numeric') && isa(varargin{5},'gtsam.Cal3_S2') && isa(varargin{6},'gtsam.Pose3')
        [ my_ptr, base_ptr ] = gtsam_wrapper(1982, varargin{1}, varargin{2}, varargin{3}, varargin{4}, varargin{5}, varargin{6});
      elseif nargin == 7 && isa(varargin{1},'gtsam.Point2') && isa(varargin{2},'gtsam.noiseModel.Base') && isa(varargin{3},'numeric') && isa(varargin{4},'numeric') && isa(varargin{5},'gtsam.Cal3_S2') && isa(varargin{6},'logical') && isa(varargin{7},'logical')
        [ my_ptr, base_ptr ] = gtsam_wrapper(1983, varargin{1}, varargin{2}, varargin{3}, varargin{4}, varargin{5}, varargin{6}, varargin{7});
      elseif nargin == 8 && isa(varargin{1},'gtsam.Point2') && isa(varargin{2},'gtsam.noiseModel.Base') && isa(varargin{3},'numeric') && isa(varargin{4},'numeric') && isa(varargin{5},'gtsam.Cal3_S2') && isa(varargin{6},'logical') && isa(varargin{7},'logical') && isa(varargin{8},'gtsam.Pose3')
        [ my_ptr, base_ptr ] = gtsam_wrapper(1984, varargin{1}, varargin{2}, varargin{3}, varargin{4}, varargin{5}, varargin{6}, varargin{7}, varargin{8});
      else
        error('Arguments do not match any overload of gtsam.GenericProjectionFactorCal3_S2 constructor');
      end
      obj = obj@gtsam.NonlinearFactor(uint64(5139824614673773682), base_ptr);
      obj.ptr_gtsamGenericProjectionFactorCal3_S2 = my_ptr;
    end

    function delete(obj)
      gtsam_wrapper(1985, obj.ptr_gtsamGenericProjectionFactorCal3_S2);
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
        varargout{1} = gtsam_wrapper(1986, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.GenericProjectionFactorCal3_S2.active');
      end
    end

    function varargout = calibration(this, varargin)
      % CALIBRATION usage: calibration() : returns gtsam::Cal3_S2
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % calibration()
      if length(varargin) == 0
        varargout{1} = gtsam_wrapper(1987, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.GenericProjectionFactorCal3_S2.calibration');
      end
    end

    function varargout = clone(this, varargin)
      % CLONE usage: clone() : returns gtsam::NonlinearFactor
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % clone()
      if length(varargin) == 0
        varargout{1} = gtsam_wrapper(1988, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.GenericProjectionFactorCal3_S2.clone');
      end
    end

    function varargout = dim(this, varargin)
      % DIM usage: dim() : returns size_t
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % dim()
      if length(varargin) == 0
        varargout{1} = gtsam_wrapper(1989, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.GenericProjectionFactorCal3_S2.dim');
      end
    end

    function varargout = equals(this, varargin)
      % EQUALS usage: equals(NonlinearFactor other, double tol) : returns void
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % equals(NonlinearFactor other, double tol)
      if length(varargin) == 2 && isa(varargin{1},'gtsam.NonlinearFactor') && isa(varargin{2},'double')
        gtsam_wrapper(1990, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.GenericProjectionFactorCal3_S2.equals');
      end
    end

    function varargout = error(this, varargin)
      % ERROR usage: error(Values c) : returns double
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % error(Values c)
      if length(varargin) == 1 && isa(varargin{1},'gtsam.Values')
        varargout{1} = gtsam_wrapper(1991, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.GenericProjectionFactorCal3_S2.error');
      end
    end

    function varargout = keys(this, varargin)
      % KEYS usage: keys() : returns gtsam::KeyVector
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % keys()
      if length(varargin) == 0
        varargout{1} = gtsam_wrapper(1992, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.GenericProjectionFactorCal3_S2.keys');
      end
    end

    function varargout = linearize(this, varargin)
      % LINEARIZE usage: linearize(Values c, Ordering ordering) : returns gtsam::GaussianFactor
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % linearize(Values c, Ordering ordering)
      if length(varargin) == 2 && isa(varargin{1},'gtsam.Values') && isa(varargin{2},'gtsam.Ordering')
        varargout{1} = gtsam_wrapper(1993, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.GenericProjectionFactorCal3_S2.linearize');
      end
    end

    function varargout = measured(this, varargin)
      % MEASURED usage: measured() : returns gtsam::Point2
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % measured()
      if length(varargin) == 0
        varargout{1} = gtsam_wrapper(1994, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.GenericProjectionFactorCal3_S2.measured');
      end
    end

    function varargout = print(this, varargin)
      % PRINT usage: print(string s) : returns void
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % print(string s)
      if length(varargin) == 1 && isa(varargin{1},'char')
        gtsam_wrapper(1995, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.GenericProjectionFactorCal3_S2.print');
      end
    end

    function varargout = printKeys(this, varargin)
      % PRINTKEYS usage: printKeys(string s) : returns void
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % printKeys(string s)
      if length(varargin) == 1 && isa(varargin{1},'char')
        gtsam_wrapper(1996, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.GenericProjectionFactorCal3_S2.printKeys');
      end
    end

    function varargout = size(this, varargin)
      % SIZE usage: size() : returns size_t
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % size()
      if length(varargin) == 0
        varargout{1} = gtsam_wrapper(1997, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.GenericProjectionFactorCal3_S2.size');
      end
    end

    function varargout = throwCheirality(this, varargin)
      % THROWCHEIRALITY usage: throwCheirality() : returns bool
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % throwCheirality()
      if length(varargin) == 0
        varargout{1} = gtsam_wrapper(1998, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.GenericProjectionFactorCal3_S2.throwCheirality');
      end
    end

    function varargout = verboseCheirality(this, varargin)
      % VERBOSECHEIRALITY usage: verboseCheirality() : returns bool
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % verboseCheirality()
      if length(varargin) == 0
        varargout{1} = gtsam_wrapper(1999, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.GenericProjectionFactorCal3_S2.verboseCheirality');
      end
    end

  end

  methods(Static = true)
  end
end
