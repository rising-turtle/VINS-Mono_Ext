%class ISAM2Params, see Doxygen page for details
%at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
%
%-------Constructors-------
%ISAM2Params()
%
%-------Methods-------
%getFactorization() : returns string
%getRelinearizeSkip() : returns int
%isCacheLinearizedFactors() : returns bool
%isEnableDetailedResults() : returns bool
%isEnablePartialRelinearizationCheck() : returns bool
%isEnableRelinearization() : returns bool
%isEvaluateNonlinearError() : returns bool
%print(string str) : returns void
%setCacheLinearizedFactors(bool cacheLinearizedFactors) : returns void
%setEnableDetailedResults(bool enableDetailedResults) : returns void
%setEnablePartialRelinearizationCheck(bool enablePartialRelinearizationCheck) : returns void
%setEnableRelinearization(bool enableRelinearization) : returns void
%setEvaluateNonlinearError(bool evaluateNonlinearError) : returns void
%setFactorization(string factorization) : returns void
%setOptimizationParams(ISAM2GaussNewtonParams params) : returns void
%setOptimizationParams(ISAM2DoglegParams params) : returns void
%setRelinearizeSkip(int relinearizeSkip) : returns void
%setRelinearizeThreshold(double relinearizeThreshold) : returns void
%setRelinearizeThreshold(ISAM2ThresholdMap relinearizeThreshold) : returns void
%
classdef ISAM2Params < handle
  properties
    ptr_gtsamISAM2Params = 0
  end
  methods
    function obj = ISAM2Params(varargin)
      if nargin == 2 && isa(varargin{1}, 'uint64') && varargin{1} == uint64(5139824614673773682)
        my_ptr = varargin{2};
        gtsam_wrapper(1140, my_ptr);
      elseif nargin == 0
        my_ptr = gtsam_wrapper(1141);
      else
        error('Arguments do not match any overload of gtsam.ISAM2Params constructor');
      end
      obj.ptr_gtsamISAM2Params = my_ptr;
    end

    function delete(obj)
      gtsam_wrapper(1142, obj.ptr_gtsamISAM2Params);
    end

    function display(obj), obj.print(''); end
    %DISPLAY Calls print on the object
    function disp(obj), obj.display; end
    %DISP Calls print on the object
    function varargout = getFactorization(this, varargin)
      % GETFACTORIZATION usage: getFactorization() : returns string
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % getFactorization()
      if length(varargin) == 0
        varargout{1} = gtsam_wrapper(1143, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.ISAM2Params.getFactorization');
      end
    end

    function varargout = getRelinearizeSkip(this, varargin)
      % GETRELINEARIZESKIP usage: getRelinearizeSkip() : returns int
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % getRelinearizeSkip()
      if length(varargin) == 0
        varargout{1} = gtsam_wrapper(1144, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.ISAM2Params.getRelinearizeSkip');
      end
    end

    function varargout = isCacheLinearizedFactors(this, varargin)
      % ISCACHELINEARIZEDFACTORS usage: isCacheLinearizedFactors() : returns bool
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % isCacheLinearizedFactors()
      if length(varargin) == 0
        varargout{1} = gtsam_wrapper(1145, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.ISAM2Params.isCacheLinearizedFactors');
      end
    end

    function varargout = isEnableDetailedResults(this, varargin)
      % ISENABLEDETAILEDRESULTS usage: isEnableDetailedResults() : returns bool
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % isEnableDetailedResults()
      if length(varargin) == 0
        varargout{1} = gtsam_wrapper(1146, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.ISAM2Params.isEnableDetailedResults');
      end
    end

    function varargout = isEnablePartialRelinearizationCheck(this, varargin)
      % ISENABLEPARTIALRELINEARIZATIONCHECK usage: isEnablePartialRelinearizationCheck() : returns bool
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % isEnablePartialRelinearizationCheck()
      if length(varargin) == 0
        varargout{1} = gtsam_wrapper(1147, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.ISAM2Params.isEnablePartialRelinearizationCheck');
      end
    end

    function varargout = isEnableRelinearization(this, varargin)
      % ISENABLERELINEARIZATION usage: isEnableRelinearization() : returns bool
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % isEnableRelinearization()
      if length(varargin) == 0
        varargout{1} = gtsam_wrapper(1148, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.ISAM2Params.isEnableRelinearization');
      end
    end

    function varargout = isEvaluateNonlinearError(this, varargin)
      % ISEVALUATENONLINEARERROR usage: isEvaluateNonlinearError() : returns bool
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % isEvaluateNonlinearError()
      if length(varargin) == 0
        varargout{1} = gtsam_wrapper(1149, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.ISAM2Params.isEvaluateNonlinearError');
      end
    end

    function varargout = print(this, varargin)
      % PRINT usage: print(string str) : returns void
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % print(string str)
      if length(varargin) == 1 && isa(varargin{1},'char')
        gtsam_wrapper(1150, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.ISAM2Params.print');
      end
    end

    function varargout = setCacheLinearizedFactors(this, varargin)
      % SETCACHELINEARIZEDFACTORS usage: setCacheLinearizedFactors(bool cacheLinearizedFactors) : returns void
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % setCacheLinearizedFactors(bool cacheLinearizedFactors)
      if length(varargin) == 1 && isa(varargin{1},'logical')
        gtsam_wrapper(1151, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.ISAM2Params.setCacheLinearizedFactors');
      end
    end

    function varargout = setEnableDetailedResults(this, varargin)
      % SETENABLEDETAILEDRESULTS usage: setEnableDetailedResults(bool enableDetailedResults) : returns void
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % setEnableDetailedResults(bool enableDetailedResults)
      if length(varargin) == 1 && isa(varargin{1},'logical')
        gtsam_wrapper(1152, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.ISAM2Params.setEnableDetailedResults');
      end
    end

    function varargout = setEnablePartialRelinearizationCheck(this, varargin)
      % SETENABLEPARTIALRELINEARIZATIONCHECK usage: setEnablePartialRelinearizationCheck(bool enablePartialRelinearizationCheck) : returns void
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % setEnablePartialRelinearizationCheck(bool enablePartialRelinearizationCheck)
      if length(varargin) == 1 && isa(varargin{1},'logical')
        gtsam_wrapper(1153, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.ISAM2Params.setEnablePartialRelinearizationCheck');
      end
    end

    function varargout = setEnableRelinearization(this, varargin)
      % SETENABLERELINEARIZATION usage: setEnableRelinearization(bool enableRelinearization) : returns void
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % setEnableRelinearization(bool enableRelinearization)
      if length(varargin) == 1 && isa(varargin{1},'logical')
        gtsam_wrapper(1154, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.ISAM2Params.setEnableRelinearization');
      end
    end

    function varargout = setEvaluateNonlinearError(this, varargin)
      % SETEVALUATENONLINEARERROR usage: setEvaluateNonlinearError(bool evaluateNonlinearError) : returns void
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % setEvaluateNonlinearError(bool evaluateNonlinearError)
      if length(varargin) == 1 && isa(varargin{1},'logical')
        gtsam_wrapper(1155, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.ISAM2Params.setEvaluateNonlinearError');
      end
    end

    function varargout = setFactorization(this, varargin)
      % SETFACTORIZATION usage: setFactorization(string factorization) : returns void
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % setFactorization(string factorization)
      if length(varargin) == 1 && isa(varargin{1},'char')
        gtsam_wrapper(1156, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.ISAM2Params.setFactorization');
      end
    end

    function varargout = setOptimizationParams(this, varargin)
      % SETOPTIMIZATIONPARAMS usage: setOptimizationParams(ISAM2GaussNewtonParams params),  setOptimizationParams(ISAM2DoglegParams params) : returns void
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % setOptimizationParams(ISAM2GaussNewtonParams params)
      % setOptimizationParams(ISAM2DoglegParams params)
      if length(varargin) == 1 && isa(varargin{1},'gtsam.ISAM2GaussNewtonParams')
        gtsam_wrapper(1157, this, varargin{:});
      elseif length(varargin) == 1 && isa(varargin{1},'gtsam.ISAM2DoglegParams')
        gtsam_wrapper(1158, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.ISAM2Params.setOptimizationParams');
      end
    end

    function varargout = setRelinearizeSkip(this, varargin)
      % SETRELINEARIZESKIP usage: setRelinearizeSkip(int relinearizeSkip) : returns void
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % setRelinearizeSkip(int relinearizeSkip)
      if length(varargin) == 1 && isa(varargin{1},'numeric')
        gtsam_wrapper(1159, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.ISAM2Params.setRelinearizeSkip');
      end
    end

    function varargout = setRelinearizeThreshold(this, varargin)
      % SETRELINEARIZETHRESHOLD usage: setRelinearizeThreshold(double relinearizeThreshold),  setRelinearizeThreshold(ISAM2ThresholdMap relinearizeThreshold) : returns void
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % setRelinearizeThreshold(double relinearizeThreshold)
      % setRelinearizeThreshold(ISAM2ThresholdMap relinearizeThreshold)
      if length(varargin) == 1 && isa(varargin{1},'double')
        gtsam_wrapper(1160, this, varargin{:});
      elseif length(varargin) == 1 && isa(varargin{1},'gtsam.ISAM2ThresholdMap')
        gtsam_wrapper(1161, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.ISAM2Params.setRelinearizeThreshold');
      end
    end

  end

  methods(Static = true)
  end
end
