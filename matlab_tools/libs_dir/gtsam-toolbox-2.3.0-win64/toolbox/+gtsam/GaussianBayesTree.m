%class GaussianBayesTree, see Doxygen page for details
%at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
%
%-------Constructors-------
%GaussianBayesTree()
%GaussianBayesTree(GaussianBayesNet bn)
%GaussianBayesTree(GaussianBayesNet other)
%
classdef GaussianBayesTree < gtsam.GaussianBayesTreeBase
  properties
    ptr_gtsamGaussianBayesTree = 0
  end
  methods
    function obj = GaussianBayesTree(varargin)
      if (nargin == 2 || (nargin == 3 && strcmp(varargin{3}, 'void'))) && isa(varargin{1}, 'uint64') && varargin{1} == uint64(5139824614673773682)
        if nargin == 2
          my_ptr = varargin{2};
        else
          my_ptr = gtsam_wrapper(619, varargin{2});
        end
        base_ptr = gtsam_wrapper(618, my_ptr);
      elseif nargin == 0
        [ my_ptr, base_ptr ] = gtsam_wrapper(620);
      elseif nargin == 1 && isa(varargin{1},'gtsam.GaussianBayesNet')
        [ my_ptr, base_ptr ] = gtsam_wrapper(621, varargin{1});
      elseif nargin == 1 && isa(varargin{1},'gtsam.GaussianBayesNet')
        [ my_ptr, base_ptr ] = gtsam_wrapper(622, varargin{1});
      else
        error('Arguments do not match any overload of gtsam.GaussianBayesTree constructor');
      end
      obj = obj@gtsam.GaussianBayesTreeBase(uint64(5139824614673773682), base_ptr);
      obj.ptr_gtsamGaussianBayesTree = my_ptr;
    end

    function delete(obj)
      gtsam_wrapper(623, obj.ptr_gtsamGaussianBayesTree);
    end

    function display(obj), obj.print(''); end
    %DISPLAY Calls print on the object
    function disp(obj), obj.display; end
    %DISP Calls print on the object
  end

  methods(Static = true)
  end
end
