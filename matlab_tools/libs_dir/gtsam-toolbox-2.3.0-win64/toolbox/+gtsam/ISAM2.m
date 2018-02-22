%class ISAM2, see Doxygen page for details
%at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
%
%-------Constructors-------
%ISAM2()
%ISAM2(ISAM2Params params)
%ISAM2(ISAM2 other)
%
%-------Methods-------
%calculateBestEstimate() : returns gtsam::Values
%calculateEstimate() : returns gtsam::Values
%equals(ISAM2 other, double tol) : returns bool
%getDelta() : returns gtsam::VectorValues
%getFactorsUnsafe() : returns gtsam::NonlinearFactorGraph
%getLinearizationPoint() : returns gtsam::Values
%getOrdering() : returns gtsam::Ordering
%getVariableIndex() : returns gtsam::VariableIndex
%params() : returns gtsam::ISAM2Params
%print(string s) : returns void
%printStats() : returns void
%saveGraph(string s) : returns void
%update() : returns gtsam::ISAM2Result
%update(NonlinearFactorGraph newFactors, Values newTheta) : returns gtsam::ISAM2Result
%update(NonlinearFactorGraph newFactors, Values newTheta, KeyVector removeFactorIndices) : returns gtsam::ISAM2Result
%
classdef ISAM2 < gtsam.ISAM2BayesTree
  properties
    ptr_gtsamISAM2 = 0
  end
  methods
    function obj = ISAM2(varargin)
      if (nargin == 2 || (nargin == 3 && strcmp(varargin{3}, 'void'))) && isa(varargin{1}, 'uint64') && varargin{1} == uint64(5139824614673773682)
        if nargin == 2
          my_ptr = varargin{2};
        else
          my_ptr = gtsam_wrapper(1178, varargin{2});
        end
        base_ptr = gtsam_wrapper(1177, my_ptr);
      elseif nargin == 0
        [ my_ptr, base_ptr ] = gtsam_wrapper(1179);
      elseif nargin == 1 && isa(varargin{1},'gtsam.ISAM2Params')
        [ my_ptr, base_ptr ] = gtsam_wrapper(1180, varargin{1});
      elseif nargin == 1 && isa(varargin{1},'gtsam.ISAM2')
        [ my_ptr, base_ptr ] = gtsam_wrapper(1181, varargin{1});
      else
        error('Arguments do not match any overload of gtsam.ISAM2 constructor');
      end
      obj = obj@gtsam.ISAM2BayesTree(uint64(5139824614673773682), base_ptr);
      obj.ptr_gtsamISAM2 = my_ptr;
    end

    function delete(obj)
      gtsam_wrapper(1182, obj.ptr_gtsamISAM2);
    end

    function display(obj), obj.print(''); end
    %DISPLAY Calls print on the object
    function disp(obj), obj.display; end
    %DISP Calls print on the object
    function varargout = calculateBestEstimate(this, varargin)
      % CALCULATEBESTESTIMATE usage: calculateBestEstimate() : returns gtsam::Values
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % calculateBestEstimate()
      if length(varargin) == 0
        varargout{1} = gtsam_wrapper(1183, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.ISAM2.calculateBestEstimate');
      end
    end

    function varargout = calculateEstimate(this, varargin)
      % CALCULATEESTIMATE usage: calculateEstimate() : returns gtsam::Values
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % calculateEstimate()
      if length(varargin) == 0
        varargout{1} = gtsam_wrapper(1184, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.ISAM2.calculateEstimate');
      end
    end

    function varargout = equals(this, varargin)
      % EQUALS usage: equals(ISAM2 other, double tol) : returns bool
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % equals(ISAM2 other, double tol)
      if length(varargin) == 2 && isa(varargin{1},'gtsam.ISAM2') && isa(varargin{2},'double')
        varargout{1} = gtsam_wrapper(1185, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.ISAM2.equals');
      end
    end

    function varargout = getDelta(this, varargin)
      % GETDELTA usage: getDelta() : returns gtsam::VectorValues
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % getDelta()
      if length(varargin) == 0
        varargout{1} = gtsam_wrapper(1186, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.ISAM2.getDelta');
      end
    end

    function varargout = getFactorsUnsafe(this, varargin)
      % GETFACTORSUNSAFE usage: getFactorsUnsafe() : returns gtsam::NonlinearFactorGraph
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % getFactorsUnsafe()
      if length(varargin) == 0
        varargout{1} = gtsam_wrapper(1187, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.ISAM2.getFactorsUnsafe');
      end
    end

    function varargout = getLinearizationPoint(this, varargin)
      % GETLINEARIZATIONPOINT usage: getLinearizationPoint() : returns gtsam::Values
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % getLinearizationPoint()
      if length(varargin) == 0
        varargout{1} = gtsam_wrapper(1188, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.ISAM2.getLinearizationPoint');
      end
    end

    function varargout = getOrdering(this, varargin)
      % GETORDERING usage: getOrdering() : returns gtsam::Ordering
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % getOrdering()
      if length(varargin) == 0
        varargout{1} = gtsam_wrapper(1189, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.ISAM2.getOrdering');
      end
    end

    function varargout = getVariableIndex(this, varargin)
      % GETVARIABLEINDEX usage: getVariableIndex() : returns gtsam::VariableIndex
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % getVariableIndex()
      if length(varargin) == 0
        varargout{1} = gtsam_wrapper(1190, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.ISAM2.getVariableIndex');
      end
    end

    function varargout = params(this, varargin)
      % PARAMS usage: params() : returns gtsam::ISAM2Params
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % params()
      if length(varargin) == 0
        varargout{1} = gtsam_wrapper(1191, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.ISAM2.params');
      end
    end

    function varargout = print(this, varargin)
      % PRINT usage: print(string s) : returns void
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % print(string s)
      if length(varargin) == 1 && isa(varargin{1},'char')
        gtsam_wrapper(1192, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.ISAM2.print');
      end
    end

    function varargout = printStats(this, varargin)
      % PRINTSTATS usage: printStats() : returns void
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % printStats()
      if length(varargin) == 0
        gtsam_wrapper(1193, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.ISAM2.printStats');
      end
    end

    function varargout = saveGraph(this, varargin)
      % SAVEGRAPH usage: saveGraph(string s) : returns void
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % saveGraph(string s)
      if length(varargin) == 1 && isa(varargin{1},'char')
        gtsam_wrapper(1194, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.ISAM2.saveGraph');
      end
    end

    function varargout = update(this, varargin)
      % UPDATE usage: update(),  update(NonlinearFactorGraph newFactors, Values newTheta),  update(NonlinearFactorGraph newFactors, Values newTheta, KeyVector removeFactorIndices) : returns gtsam::ISAM2Result
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % update()
      % update(NonlinearFactorGraph newFactors, Values newTheta)
      % update(NonlinearFactorGraph newFactors, Values newTheta, KeyVector removeFactorIndices)
      if length(varargin) == 0
        varargout{1} = gtsam_wrapper(1195, this, varargin{:});
      elseif length(varargin) == 2 && isa(varargin{1},'gtsam.NonlinearFactorGraph') && isa(varargin{2},'gtsam.Values')
        varargout{1} = gtsam_wrapper(1196, this, varargin{:});
      elseif length(varargin) == 3 && isa(varargin{1},'gtsam.NonlinearFactorGraph') && isa(varargin{2},'gtsam.Values') && isa(varargin{3},'gtsam.KeyVector')
        varargout{1} = gtsam_wrapper(1197, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.ISAM2.update');
      end
    end

  end

  methods(Static = true)
  end
end
