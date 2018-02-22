%class NonlinearISAM, see Doxygen page for details
%at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
%
%-------Constructors-------
%NonlinearISAM()
%NonlinearISAM(int reorderInterval)
%
%-------Methods-------
%addKey(size_t key) : returns void
%bayesTree() : returns gtsam::GaussianISAM
%estimate() : returns gtsam::Values
%getFactorsUnsafe() : returns gtsam::NonlinearFactorGraph
%getLinearizationPoint() : returns gtsam::Values
%getOrdering() : returns gtsam::Ordering
%marginalCovariance(size_t key) : returns Matrix
%print(string s) : returns void
%printStats() : returns void
%reorderCounter() : returns int
%reorderInterval() : returns int
%reorder_relinearize() : returns void
%saveGraph(string s) : returns void
%setOrdering(Ordering new_ordering) : returns void
%update(NonlinearFactorGraph newFactors, Values initialValues) : returns void
%
classdef NonlinearISAM < handle
  properties
    ptr_gtsamNonlinearISAM = 0
  end
  methods
    function obj = NonlinearISAM(varargin)
      if nargin == 2 && isa(varargin{1}, 'uint64') && varargin{1} == uint64(5139824614673773682)
        my_ptr = varargin{2};
        gtsam_wrapper(1198, my_ptr);
      elseif nargin == 0
        my_ptr = gtsam_wrapper(1199);
      elseif nargin == 1 && isa(varargin{1},'numeric')
        my_ptr = gtsam_wrapper(1200, varargin{1});
      else
        error('Arguments do not match any overload of gtsam.NonlinearISAM constructor');
      end
      obj.ptr_gtsamNonlinearISAM = my_ptr;
    end

    function delete(obj)
      gtsam_wrapper(1201, obj.ptr_gtsamNonlinearISAM);
    end

    function display(obj), obj.print(''); end
    %DISPLAY Calls print on the object
    function disp(obj), obj.display; end
    %DISP Calls print on the object
    function varargout = addKey(this, varargin)
      % ADDKEY usage: addKey(size_t key) : returns void
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % addKey(size_t key)
      if length(varargin) == 1 && isa(varargin{1},'numeric')
        gtsam_wrapper(1202, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.NonlinearISAM.addKey');
      end
    end

    function varargout = bayesTree(this, varargin)
      % BAYESTREE usage: bayesTree() : returns gtsam::GaussianISAM
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % bayesTree()
      if length(varargin) == 0
        varargout{1} = gtsam_wrapper(1203, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.NonlinearISAM.bayesTree');
      end
    end

    function varargout = estimate(this, varargin)
      % ESTIMATE usage: estimate() : returns gtsam::Values
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % estimate()
      if length(varargin) == 0
        varargout{1} = gtsam_wrapper(1204, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.NonlinearISAM.estimate');
      end
    end

    function varargout = getFactorsUnsafe(this, varargin)
      % GETFACTORSUNSAFE usage: getFactorsUnsafe() : returns gtsam::NonlinearFactorGraph
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % getFactorsUnsafe()
      if length(varargin) == 0
        varargout{1} = gtsam_wrapper(1205, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.NonlinearISAM.getFactorsUnsafe');
      end
    end

    function varargout = getLinearizationPoint(this, varargin)
      % GETLINEARIZATIONPOINT usage: getLinearizationPoint() : returns gtsam::Values
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % getLinearizationPoint()
      if length(varargin) == 0
        varargout{1} = gtsam_wrapper(1206, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.NonlinearISAM.getLinearizationPoint');
      end
    end

    function varargout = getOrdering(this, varargin)
      % GETORDERING usage: getOrdering() : returns gtsam::Ordering
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % getOrdering()
      if length(varargin) == 0
        varargout{1} = gtsam_wrapper(1207, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.NonlinearISAM.getOrdering');
      end
    end

    function varargout = marginalCovariance(this, varargin)
      % MARGINALCOVARIANCE usage: marginalCovariance(size_t key) : returns Matrix
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % marginalCovariance(size_t key)
      if length(varargin) == 1 && isa(varargin{1},'numeric')
        varargout{1} = gtsam_wrapper(1208, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.NonlinearISAM.marginalCovariance');
      end
    end

    function varargout = print(this, varargin)
      % PRINT usage: print(string s) : returns void
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % print(string s)
      if length(varargin) == 1 && isa(varargin{1},'char')
        gtsam_wrapper(1209, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.NonlinearISAM.print');
      end
    end

    function varargout = printStats(this, varargin)
      % PRINTSTATS usage: printStats() : returns void
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % printStats()
      if length(varargin) == 0
        gtsam_wrapper(1210, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.NonlinearISAM.printStats');
      end
    end

    function varargout = reorderCounter(this, varargin)
      % REORDERCOUNTER usage: reorderCounter() : returns int
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % reorderCounter()
      if length(varargin) == 0
        varargout{1} = gtsam_wrapper(1211, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.NonlinearISAM.reorderCounter');
      end
    end

    function varargout = reorderInterval(this, varargin)
      % REORDERINTERVAL usage: reorderInterval() : returns int
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % reorderInterval()
      if length(varargin) == 0
        varargout{1} = gtsam_wrapper(1212, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.NonlinearISAM.reorderInterval');
      end
    end

    function varargout = reorder_relinearize(this, varargin)
      % REORDER_RELINEARIZE usage: reorder_relinearize() : returns void
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % reorder_relinearize()
      if length(varargin) == 0
        gtsam_wrapper(1213, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.NonlinearISAM.reorder_relinearize');
      end
    end

    function varargout = saveGraph(this, varargin)
      % SAVEGRAPH usage: saveGraph(string s) : returns void
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % saveGraph(string s)
      if length(varargin) == 1 && isa(varargin{1},'char')
        gtsam_wrapper(1214, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.NonlinearISAM.saveGraph');
      end
    end

    function varargout = setOrdering(this, varargin)
      % SETORDERING usage: setOrdering(Ordering new_ordering) : returns void
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % setOrdering(Ordering new_ordering)
      if length(varargin) == 1 && isa(varargin{1},'gtsam.Ordering')
        gtsam_wrapper(1215, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.NonlinearISAM.setOrdering');
      end
    end

    function varargout = update(this, varargin)
      % UPDATE usage: update(NonlinearFactorGraph newFactors, Values initialValues) : returns void
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % update(NonlinearFactorGraph newFactors, Values initialValues)
      if length(varargin) == 2 && isa(varargin{1},'gtsam.NonlinearFactorGraph') && isa(varargin{2},'gtsam.Values')
        gtsam_wrapper(1216, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.NonlinearISAM.update');
      end
    end

  end

  methods(Static = true)
  end
end
