%class GaussianISAM, see Doxygen page for details
%at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
%
%-------Constructors-------
%GaussianISAM()
%
%-------Methods-------
%clear() : returns void
%jointBayesNet(size_t key1, size_t key2) : returns gtsam::GaussianBayesNet
%marginalBayesNet(size_t key) : returns gtsam::GaussianBayesNet
%marginalCovariance(size_t key) : returns Matrix
%marginalFactor(size_t j) : returns gtsam::GaussianFactor
%saveGraph(string s) : returns void
%
classdef GaussianISAM < gtsam.GaussianBayesTree
  properties
    ptr_gtsamGaussianISAM = 0
  end
  methods
    function obj = GaussianISAM(varargin)
      if (nargin == 2 || (nargin == 3 && strcmp(varargin{3}, 'void'))) && isa(varargin{1}, 'uint64') && varargin{1} == uint64(5139824614673773682)
        if nargin == 2
          my_ptr = varargin{2};
        else
          my_ptr = gtsam_wrapper(730, varargin{2});
        end
        base_ptr = gtsam_wrapper(729, my_ptr);
      elseif nargin == 0
        [ my_ptr, base_ptr ] = gtsam_wrapper(731);
      else
        error('Arguments do not match any overload of gtsam.GaussianISAM constructor');
      end
      obj = obj@gtsam.GaussianBayesTree(uint64(5139824614673773682), base_ptr);
      obj.ptr_gtsamGaussianISAM = my_ptr;
    end

    function delete(obj)
      gtsam_wrapper(732, obj.ptr_gtsamGaussianISAM);
    end

    function display(obj), obj.print(''); end
    %DISPLAY Calls print on the object
    function disp(obj), obj.display; end
    %DISP Calls print on the object
    function varargout = clear(this, varargin)
      % CLEAR usage: clear() : returns void
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % clear()
      if length(varargin) == 0
        gtsam_wrapper(733, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.GaussianISAM.clear');
      end
    end

    function varargout = jointBayesNet(this, varargin)
      % JOINTBAYESNET usage: jointBayesNet(size_t key1, size_t key2) : returns gtsam::GaussianBayesNet
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % jointBayesNet(size_t key1, size_t key2)
      if length(varargin) == 2 && isa(varargin{1},'numeric') && isa(varargin{2},'numeric')
        varargout{1} = gtsam_wrapper(734, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.GaussianISAM.jointBayesNet');
      end
    end

    function varargout = marginalBayesNet(this, varargin)
      % MARGINALBAYESNET usage: marginalBayesNet(size_t key) : returns gtsam::GaussianBayesNet
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % marginalBayesNet(size_t key)
      if length(varargin) == 1 && isa(varargin{1},'numeric')
        varargout{1} = gtsam_wrapper(735, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.GaussianISAM.marginalBayesNet');
      end
    end

    function varargout = marginalCovariance(this, varargin)
      % MARGINALCOVARIANCE usage: marginalCovariance(size_t key) : returns Matrix
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % marginalCovariance(size_t key)
      if length(varargin) == 1 && isa(varargin{1},'numeric')
        varargout{1} = gtsam_wrapper(736, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.GaussianISAM.marginalCovariance');
      end
    end

    function varargout = marginalFactor(this, varargin)
      % MARGINALFACTOR usage: marginalFactor(size_t j) : returns gtsam::GaussianFactor
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % marginalFactor(size_t j)
      if length(varargin) == 1 && isa(varargin{1},'numeric')
        varargout{1} = gtsam_wrapper(737, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.GaussianISAM.marginalFactor');
      end
    end

    function varargout = saveGraph(this, varargin)
      % SAVEGRAPH usage: saveGraph(string s) : returns void
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % saveGraph(string s)
      if length(varargin) == 1 && isa(varargin{1},'char')
        gtsam_wrapper(738, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.GaussianISAM.saveGraph');
      end
    end

  end

  methods(Static = true)
  end
end
